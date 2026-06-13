module Components
  module Collections
    class PinContent::Thumb < Pins::Pin::ThumbBase
      include Phlex::Rails::Helpers::SimpleFormat

      def view_template(&)
        container do
          div do
            simple_format(pinable_description, class: "text-sm font-normal mt-2") if pinable_description.present?
            Components::Collections::MetaInfo(collection: @pin.pinable, opts: { show_author: true })
          end
        end
      end

      private

      def core_container_classes
        super + " p-3"
      end

      def pinable_description
        @pin.pinable.description
      end
    end
  end
end
