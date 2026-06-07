module Components
  module Collections
    class Inbox < Components::Base
      class InboxCollection
        attr_accessor :name, :description, :private, :pins, :inbox, :pins_count

        def inbox?
          inbox
        end
      end

      def view_template(&)
        render Components::Collections::Collection.new(collection: collection, id: :collection_inbox)
      end

      private

      def collection
        InboxNullObject.new(user: current_user)
      end
    end
  end
end
