module Components
  module Collections
    class MetaInfo < Components::Base
      include Phlex::Rails::Helpers::TimeAgoInWords
      include Phlex::Rails::Helpers::Pluralize

      def initialize(collection:, opts: {})
        @collection = collection
        @opts = opts
      end

      def view_template(&)
        Text(size: "1", class: "text-muted-foreground mt-2 italic") do
          content
        end
      end

      private

      def content
        info = []

        info << "private" if @collection.private
        info << "started #{time_ago_in_words(@collection.created_at)} ago"
        info << "updated #{time_ago_in_words(@collection.changed_at)} ago" if @collection.changed_at
        info << "containing #{pluralize(@collection.pins_count, "pin")}"

        info = info.to_sentence

        info << ". Run by #{@collection.user}." if @opts[:show_author]
        info
      end
    end
  end
end
