# frozen_string_literal: true

class Views::Collections::Inbox < Views::Base
  include Phlex::Rails::Helpers::TimeAgoInWords
  include Phlex::Rails::Helpers::Pluralize

  def initialize(collection:)
    @collection = collection
  end

  def view_template
    div do
      render Components::Ui::PageHeader.new do |header|
        header.with_primary do
          RubyUI::Text(as: "p", weight: "") { @collection.description }
          RubyUI::Text(as: "p", size: "xs", weight: "muted", class: "mt-4 italic") { meta_info }
        end
      end

      render RubyUI::Separator.new(class: "my-9")

      div(class: "grid grid-cols-12 gap-9", id: "inbox-pins") do
        @collection.pins.order(id: :desc).each do |pin|
          div(class: "col-span-3") do
            render Components::Pins::Pin.new(pin: pin)
          end
        end
      end
    end
  end

  private

  def meta_info
    info = []

    info << "private" if @collection.private
    info << "started #{time_ago_in_words(@collection.created_at)} ago"
    info << "updated #{time_ago_in_words(@collection.updated_at)} ago"
    info << "containing #{pluralize(@collection.pins_count, "pin")}"

    info.to_sentence
  end
end
