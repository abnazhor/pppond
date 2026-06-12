module Components
  module Collections
    class PinContent::PrimaryActions < Components::Pins::Pin::PrimaryActions
      private

      def source_url
        user_collection_path(@pin.pinable.user, @pin.pinable)
      end
    end
  end
end
