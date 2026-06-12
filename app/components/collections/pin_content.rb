module Components
  module Collections
    class PinContent < Components::Base
      def initialize(pin:)
        @pin = pin
      end

      def view_template(&)
        render Components::Collections::PinContent::Thumb.new(pin: @pin)
        render Components::Pins::Pin::SecondaryActions.new(pin: @pin) if authenticated?
        render Components::Collections::PinContent::PrimaryActions.new(pin: @pin)
        render Components::Collections::PinContent::Meta.new(pin: @pin)
      end
    end
  end
end
