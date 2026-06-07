module Components
  module Ui
    class PageHeader < Components::Base
      def initialize
        @actions_block = nil
        @primary_block = nil
        @secondary_block = nil
        @tertiary_block = nil
      end

      def view_template(&)
        vanish(&)

        div(class: "flex justify-between items-center mb-3 w-full") do
          div { render Ui::CurrentBreadcrumbs.new }
          div(class: "flex items-center gap-2") { @actions_block&.call }
        end

        div(class: "flex gap-24") {
          div(class: "w-1/3") { @primary_block&.call } if @primary_block
          div(class: "w-1/3") { @secondary_block&.call } if @secondary_block
          div(class: "w-1/3") { @tertiary_block&.call } if @tertiary_block
        }
      end

      def with_actions(&block)
        @actions_block = block
        nil
      end

      def with_primary(&block)
        @primary_block = block
        nil
      end

      def with_secondary(&block)
        @secondary_block = block
        nil
      end

      def with_tertiary(&block)
        @tertiary_block = block
        nil
      end
    end
  end
end
