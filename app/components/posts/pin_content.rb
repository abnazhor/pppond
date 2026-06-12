module Components
  module Posts
    class PinContent < Components::Base
      def initialize(pin:)
        @pin = pin
      end

      def view_template(&)
        render Components::Posts::PinContent::Thumb.new(pin: @pin)
        render Components::Pins::Pin::SecondaryActions.new(pin: @pin) if authenticated?
        render Components::Posts::PinContent::PrimaryActions.new(pin: @pin)
        render Components::Posts::PinContent::Meta.new(pin: @pin)
      end
    end
  end
end
