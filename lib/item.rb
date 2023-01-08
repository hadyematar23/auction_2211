require 'date'
class Item
        attr_reader :name
        attr_accessor :bids
  def initialize(name)
    @name = name 
    @bids = Hash.new
    @close = true 
  end

  def add_bid(attendee, amount)
    if @close == true
      @bids[attendee] = amount
    end 
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @close = false 
  end 


end