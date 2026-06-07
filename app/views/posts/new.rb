# frozen_string_literal: true

class Views::Posts::New < Views::Base
  include Phlex::Rails::Helpers::TurboFrameTag

  def view_template
    turbo_frame_tag("new_pin") do
      h1 { "Posts::New" }
      p { "Find me in app/views/posts/new.rb" }
    end
  end
end
