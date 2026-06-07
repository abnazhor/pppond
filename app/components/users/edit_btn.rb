module Components
  module Users
    class EditBtn < Components::Base
      def initialize(user:)
        @user = user
      end

      def view_template(&)
        Dialog do
          DialogTrigger do
            Button(variant: :secondary, size: :sm) { "Edit profile" }
          end
          DialogContent do
            DialogHeader do
              DialogTitle { "Edit Profile" }
              DialogDescription { "Update your profile information" }
            end
            DialogMiddle do
              render Components::Users::Form.new(user: @user)
            end
            DialogFooter do
              Button(class: "w-full", type: "submit", form: "user_form") { "Update profile" }
            end
          end
        end
      end
    end
  end
end
