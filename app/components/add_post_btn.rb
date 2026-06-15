module Components
  class AddPostBtn < Components::Base
    include Phlex::Rails::Helpers::LinkTo

    def view_template(&)
      DropdownMenu(data: { controller: "add-post-btn" }, options: { placement: "bottom-end" }) do
        DropdownMenuTrigger(class: "w-full") do
          Button(variant: :primary, size: :sm) { "+ Add" }
        end

        DropdownMenuContent do
          DropdownMenuLabel { "What do you want to add?" }
          DropdownMenuItem(href: "#", data_action: "click->remote-dialog-btn#openDialog:prevent", data: { controller: "remote-dialog-btn", add_post_btn_target: "urlBtn", remote_dialog_btn_url_value: new_url_posts_path(post_url: { collection_id: Current.collection&.id }) }) { "Link" }
          DropdownMenuItem(href: "#", data_action: "click->remote-dialog-btn#openDialog:prevent", data: { controller: "remote-dialog-btn", add_post_btn_target: "textBtn", remote_dialog_btn_url_value: new_text_posts_path(post_text: { collection_id: Current.collection&.id }) }) { "Text" }
        end
      end
    end
  end
end
