require_relative "../lib/ebay_ruby.rb"


describe "find_items_by_keywords" do
  let(:connect) {EbayConnect.new("Ownd011f8-4423-436a-ba0c-35456d0b2db")}

  it "should find the items by searching keywords" do
    items = connect.find_items_by_keywords("ruby on rails", 3)
    items.should_not be_empty
  end

  it "should return results with count send in parameter" do
    items = connect.find_items_by_keywords("ruby on rails", 3)
    items.count.should == 3
  end
end