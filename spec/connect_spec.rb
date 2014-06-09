require_relative "../lib/ebay_ruby.rb"

describe "connect" do
  let(:app_id) {"Ownd011f8-4423-436a-ba0c-35456d0b2db" }


  it "should connect ebay api" do
    connect = EbayConnect.new(app_id)
    connect.should_not be_nil
  end

  it "connect instance should have app id" do
    connect = EbayConnect.new(app_id)
    connect.app_id.should == app_id
  end
end

