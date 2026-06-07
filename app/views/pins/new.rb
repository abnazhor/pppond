# frozen_string_literal: true

class Views::Pins::New < Views::Base
  include Phlex::Rails::Helpers::TurboFrameTag

  def view_template
    turbo_frame_tag("new_pin") do
      DialogContent do
        DialogHeader do
          DialogTitle { "Add Pin" }
          DialogDescription { "What kind of pin do you want to add?" }
        end
        DialogMiddle do
          div() {
            a(href: new_post_path, class: "bg-accent p-10 text-center hover:bg-accent-hover block") { "URL" }
          }
        end
      end
    end
  end
end
