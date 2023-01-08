require './lib/item'
require './lib/auction'
require './lib/attendee'
require 'date'

RSpec.describe Auction do 
  context "happy paths for Item" do 
  let(:auction){Auction.new}
  let(:item1){Item.new('Chalkware Piggy Bank')} 
  let(:item2){Item.new('Bamboo Picture Frame')}
  let(:item3){Item.new('Homemade Chocolate Chip Cookies')}
  let(:item4){Item.new('2 Days Dogsitting')}
  let(:item5){Item.new('Forever Stamps')}
  let(:attendee1){Attendee.new(name: 'Megan', budget: '$50')}
  let(:attendee2){Attendee.new(name: 'Bob', budget: '$75')}
  let(:attendee3){Attendee.new(name: 'Mike', budget: '$100')}
  let(:attendee4){Attendee.new(name: 'Hady', budget: '$140')}
  let(:item6){Item.new('Trip to Mexico')}


  it "exists as an object" do 
    expect(auction).to be_an_instance_of(Auction)
  end 

  it "starts out with no items" do 
    expect(auction.items).to eq([])
  end 

  it "can add some items to the acution" do 
    auction.add_item(item1)
    auction.add_item(item2)

    expect(auction.items).to match_array([item1, item2])

  end 

  it "can list the names of the items" do 
    auction.add_item(item1)
    auction.add_item(item2)

    expect(auction.item_names).to match_array(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end 

  it "can find the unpopular items" do 
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)

    expect(auction.unpopular_items).to match_array([item2, item3, item5])
  end 

  it "the list of unpopular items can change dynamically based on new bids" do 

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)

    expect(auction.unpopular_items).to match_array([item2, item5])
  
  end 

  it "can list all of the people that have made bids in the auction" do 

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)

    expect(auction.bidders).to match_array([attendee1, attendee2, attendee3])
  end 

  it "if we remove one bid and replace with another attendee the code remains functional" do 

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee4, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)

    expect(auction.bidders).to match_array([attendee4, attendee2, attendee3])
  end 

  it "the code remains functional regardless of how many attendees are in the final array" do 

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee3, 20)
    item1.add_bid(attendee4, 22)
    item4.add_bid(attendee3, 50)

    expect(auction.bidders).to match_array([attendee4, attendee3])
  end 

  it "can create a hash full of bidder info" do 

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)

    expect(auction.bidder_info).to eq({
      attendee1 => {:budget => 50, :items => [item1]}, 
      attendee2 => {:budget => 75, :items => [item1, item3]},
      attendee3 => {:budget => 100, :items => [item4]}
    })
  end 

  it "changes based on a change in input information" do 

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    auction.add_item(item6)
    item6.add_bid(attendee2, 20)
    item1.add_bid(attendee4, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)

    expect(auction.bidder_info).to eq({
      attendee4 => {:budget => 140, :items => [item1]}, 
      attendee2 => {:budget => 75, :items => [item3, item6]},
      attendee3 => {:budget => 100, :items => [item4]}
    })
  end 

  it "can create an auction with the current date" do 
# This was done just for myself as I had a lot of trouble with the Date.today portion-- started trying things that were not necessary
    expect(auction.date).to eq("01/08/2023")

  end 

  it "can test a date in the past" do 

    allow(auction).to receive(:date).and_return("03/14/1990")

    expect(auction.date).to eq("03/14/1990")

  end 

  end
end 