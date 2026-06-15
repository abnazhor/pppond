module Components
  module Posts
    class PinContent < Components::Base
      def initialize(pin:)
        @pin = pin
      end

      def view_template(&)
        if @pin.pinable.is_a?(Post::Url)
          render Components::Posts::Url::PinContent.new(pin: @pin)
        elsif @pin.pinable.is_a?(Post::Text)
          render Components::Posts::Text::PinContent.new(pin: @pin)
        else
          raise "Unknown post type"
        end
      end
    end
  end
end
