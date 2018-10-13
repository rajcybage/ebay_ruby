require 'net/http'
autoload :EbayFindItem, "ebay_ruby/ebay_find_item"

class EbayConnect

  def initialize(app_id:, campaign_id:)
    @app_id = app_id
    @campaign_id = campaign_id
  end

  attr_reader :app_id, :build_uri, :campaign_id

  def get_connect(url)
    response = Net::HTTP.get_response url
    response.body
  end

  def find_items_by_keywords(search_keyword, per_page, page_number = 1)
    str = __method__.to_s.camelize
    operation_name = str.gsub(str.first, str.first.downcase)
    search_param = "keywords=#{URI::encode(search_keyword)}"
    ebay_items = EbayFindItem.new(get_connect(build_uri(operation_name, search_param, per_page, page_number)))
    ebay_items.all_items
  end

  def find_items_by_category(category_id, per_page, page_number = 1)
    str = __method__.to_s.camelize
    operation_name = str.gsub(str.first, str.first.downcase)
    search_param = "categoryId=#{category_id}"
    ebay_items = EbayFindItem.new(get_connect(build_uri(operation_name, search_param, per_page, page_number)))
    ebay_items.all_items
  end
  #productId can be ISBN,UPC,EAN
  def find_items_by_product(product_id, per_page, page_number = 1)
    str = __method__.to_s.camelize
    operation_name = str.gsub(str.first, str.first.downcase)
    search_param = "productId=#{product_id}"
    ebay_items = EbayFindItem.new(get_connect(build_uri(operation_name, search_param, per_page, page_number)))
    ebay_items.all_items
  end

  private
  def build_uri(operation_name, search_keyword, per_page, page_number = 1)
    uri_string = "http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=#{operation_name}" \
                 "&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=#{app_id}&GLOBAL-ID=EBAY-US&RESPONSE-DATA-FORMAT=JSON" \
                 "&#{search_keyword}&paginationInput.entriesPerPage=#{per_page.to_i}&paginationInput.pageNumber=#{page_number.to_i}" \
                 "&affiliate.trackingId=#{campaign_id}&affiliate.networkId=9"
    URI(uri_string)
  end
end
