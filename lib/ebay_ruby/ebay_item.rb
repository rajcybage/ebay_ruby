class EbayItem

  def initialize(item)
    @item = item
  end

  attr_reader :item

  def build_items_data
    item.keys.each do |attribute|
      metaclass = class << self; self; end
      metaclass.send(:define_method, "#{attribute}") do
        return item[attribute]
      end
    end
  end
end
