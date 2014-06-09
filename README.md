# EbayRuby

Ebay access finding API with getting all items.

## Installation

Add this line to your application's Gemfile:

    gem 'ebay_ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ebay_ruby

## Usage

Find your App Id on ebay Account

    $ require 'ebay_ruby'
    $ c=EbayConnect.new("YOURAPPID")

Send two arguments keyword, number of entry per page

    $ items = c.find_items_by_keywords("Harry Potter", 3)
    $ items = c.find_items_by_category("CATEGORY_ID", 3)
    $ item  = c.find_items_by_product("ISBN/UPC/EAN", 3)

    $ items.first.title
    $ items.first.galleyImage
    ...
   So on



## Contributing

1. Fork it ( https://github.com/[my-github-username]/ebay_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
