require './lib/item'
require './lib/auction'
require './lib/attendee'

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

  it ""


  end
end 