module Components
  module Pins
    class AddBtn < Components::Base
      def view_template(&)
        if authenticated?
          Dialog do
            DialogTrigger do
              Button(size: :sm) { "+ Add" }
            end

            DialogContent do
              DialogHeader do
                DialogTitle { "Add Pin" }
                DialogDescription { "Enter the URL you want to pin." }
              end

              DialogMiddle do
                render Components::Posts::Form.new
              end

              DialogFooter do
                Button(class: "w-full", type: "submit", form: "post_form") { "PPPin it!" }
              end
            end
          end
        else
          Link(href: join_path, variant: :primary, size: :sm) { "+ Add" }
        end
      end
    end
  end
end
