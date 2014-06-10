require 'json'
autoload :EbayItem, "ebay_ruby/ebay_item"

class EbayFindItem

  def initialize(json)
    @json = json
  end

  attr_reader :json

  def parse
    JSON.parse(json).values.first
  end

  def all_items
    total_items = []
    begin
      parse.first["searchResult"].first["item"].each do |item|
        ebay_item = EbayItem.new(item)
        ebay_item.build_items_data
        total_items << ebay_item
      end
    rescue
      total_items = []
    end
    total_items.flatten
  end

end
