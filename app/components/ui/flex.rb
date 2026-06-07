module Components
  module Ui
    class Flex < Components::Base
      def view_template(&)
        div(class: "flex") do
          yield if block_given?
        end
      end
    end
  end
end
