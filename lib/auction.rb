require 'date'

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

  def bidders
    list= @items.map do |item|
      item.bids.keys
    end
    list.flatten.uniq
  end

  def bidder_info 
    hash = Hash.new
      bidders.each do |attendee|
        hash[attendee] = {:budget => attendee.budget, :items => items_bid_on(attendee)}
      end
    return hash
  end

  def items_bid_on(attendee)
    @items.find_all do |item|
      item.bids.keys.include?(attendee)
    end
  end

  def date 
    current_date = Date.today
    current_date = current_date.to_s
    new = "#{current_date[5]}""#{current_date[6]}/""#{current_date[8]}""#{current_date[9]}/""#{current_date[0]}""#{current_date[1]}""#{current_date[2]}""#{current_date[3]}"

    return new 
  end


end