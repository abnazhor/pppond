module Components
  class ConnectDialog < Components::Base
    include Phlex::Rails::Helpers::FormWith
    include Phlex::Rails::Helpers::TurboFrameTag
    include Phlex::Rails::Helpers::DOMID

    def view_template(&)
      Dialog(id: :connect_dialog, data: { controller: "connect-dialog", action: "connect-btn:connect-btn-clicked@window->dialog#open connect-btn:connect-btn-clicked@window->connect-dialog#open" }) do
        DialogContent do
          DialogHeader do
            DialogTitle { "Connect this post" }
            DialogDescription { "Choose a collection to connect this post to." }
          end
          DialogMiddle do
            turbo_frame_tag :connect_dialog_form, loading: :lazy, data: { connect_dialog_target: "frame" } do
              p { "Loading..." }
            end
          end
          DialogFooter do
            Button(variant: :outline, data: { action: "click->dialog#close" }) { "Cancel" }
            Button(form: "connect_form", type: :submit) { "Save" }
          end
        end
      end
    end
  end
end
