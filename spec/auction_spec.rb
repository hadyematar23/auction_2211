require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do 
  context "happy paths for Item" do 
  let(:auction){Auction.new}
  let(:item1){Item.new('Chalkware Piggy Bank')} 
  let(:item2){Item.new('Bamboo Picture Frame')}

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



  end
end 