require './lib/item'
# require './lib/auction'
# require './lib/attendee'

RSpec.describe Item do 
  context "happy paths for Item" do 
  let(:item1){Item.new('Chalkware Piggy Bank')} 
  let(:item2){Item.new('Bamboo Picture Frame')}

  it "exists as an object item" do
    expect(item1).to be_an_instance_of(Item)
    expect(item2).to be_an_instance_of(Item)
  end 

  it "has a name" do 
    expect(item1.name).to eq("Chalkware Piggy Bank")
  end 



  end 
end 