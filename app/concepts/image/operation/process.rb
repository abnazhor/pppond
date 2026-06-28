# typed: false
# frozen_string_literal: true

module Image::Operation
  class Process < Trailblazer::Operation
    step :load
    step :generate_webp
    step :select_smaller

    private

    def load(ctx, params:, **)
      file = params[:image]
      return false unless file

      ctx[:original_path] = file.path
      ctx[:original_size] = File.size(file.path)
      ctx[:vips_image]    = Vips::Image.new_from_file(file.path)
    end

    def generate_webp(ctx, vips_image:, **)
      buffer = vips_image.write_to_buffer(".webp[Q=80]")
      ctx[:webp_buffer] = buffer
      ctx[:webp_size]   = buffer.bytesize
    end

    def select_smaller(ctx, original_path:, original_size:, webp_buffer:, webp_size:, **)
      if webp_size < original_size
        ctx[:output] = {
          io: StringIO.new(webp_buffer).tap(&:rewind),
          content_type: "image/webp",
          filename: "#{File.basename(original_path, ".*")}.webp"
        }
      else
        ctx[:output] = {
          io: File.open(original_path, "rb"),
          content_type: Marcel::MimeType.for(Pathname.new(original_path)),
          filename: File.basename(original_path)
        }
      end
    end
  end
end
