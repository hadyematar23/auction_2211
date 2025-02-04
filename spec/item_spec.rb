require './lib/item'
require './lib/auction'
require './lib/attendee'


RSpec.describe Item do 
  context "happy paths for Item" do 
  let(:item1){Item.new('Chalkware Piggy Bank')} 
  let(:item2){Item.new('Bamboo Picture Frame')}
  let(:attendee){Attendee.new(name: 'Megan', budget: '$50')}
  let(:item3){Item.new('Homemade Chocolate Chip Cookies')}
  let(:item4){Item.new('2 Days Dogsitting')}
  let(:item5){Item.new('Forever Stamps')}
  let(:attendee1){Attendee.new(name: 'Megan', budget: '$50')}
  let(:attendee2){Attendee.new(name: 'Bob', budget: '$75')}
  let(:attendee3){Attendee.new(name: 'Mike', budget: '$100')}
  let(:auction){Auction.new}

  it "exists as an object item" do
    expect(item1).to be_an_instance_of(Item)
    expect(item2).to be_an_instance_of(Item)
  end 

  it "has a name" do 
    expect(item1.name).to eq("Chalkware Piggy Bank")
  end 

  it "each items starts out with no bids" do 
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)

    expect(item1.bids).to eq({})
  end 

  it "adds some bids" do 
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expect(item1.bids).to eq({
      attendee2 => 20,
      attendee1 => 22
    })
  end 

  it "finds the highest bid" do 
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expect(item1.current_high_bid).to eq(22)
  end 

  it "closes the bidding" do 
    auction.add_item(item1)
    item1.add_bid(attendee1, 22)
    expect(item1.bids).to eq({
    attendee1 => 22
    })

    

  end 

  it "closes the bidding 2" do 

    auction.add_item(item1)
    item1.add_bid(attendee1, 22)
    item1.close_bidding
    item1.add_bid(attendee2, 25)
    
    expect(item1.bids).to eq({
      attendee1 => 22
    })

  end 
end 
end 