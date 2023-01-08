class Auction
      attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item 
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    popular_items = @items.find_all do |item|
      item.bids.empty? == false
    end
    unpopular_items = @items - popular_items
    return unpopular_items
  end
end