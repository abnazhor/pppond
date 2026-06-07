class Current < ActiveSupport::CurrentAttributes
  attribute :user
  attribute :session
  attribute :collection
  attribute :breadcrumbs
  attribute :collections_for_select
end
