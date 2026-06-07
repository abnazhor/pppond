class CollectionPresenter
  def initialize(collection)
    @collection = collection
  end

  def name
    return @collection.name unless @collection.inbox?

    "Inbox"
  end

  def description
    return @collection.description unless @collection.inbox?

    "Pins visible only to you, not assigned to any collection yet."
  end
end
