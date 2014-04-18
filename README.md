Merchants
---------
#
# This is what we receive from CommisionFactory
#
*{
*  "Id":388,
*  "DateCreated":"2011-07-18T16:44:42.663",
*  "DateModified":"2014-04-17T21:46:41.68",
*  "MerchantId":388,
*  "MerchantName":"Styletread (AU)",
*  "MerchantAvatarUrl":"http://content.commissionfactory.com.au/Avatars/3F6CDC4B-E92F-49E5-889C-DF194174653E.png",
*  "Name":"Style Tread CSV Product Feed",
*  "Type":"Product Catalogue",
*  "ItemsCount":3237,
*  "Items":null},
*}

#
# This part we will store in DB
#
*MerchantId        => merchant_id:integer 
*DateCreated       => date_created:date 
*DateModified      => date_modified:date 
*MerchantName      => name:string 
*MerchantAvatarUrl => avatar_path:text 
*ItemsCount        => items_count:integer


DataFeeds
---------
#
# This is what we receive from CommisionFactory
#
*{
*  "Id": 1,
*  "DateCreated": "2000-01-01T00:00:00.000",
*  "DateModified": "2000-01-01T00:00:00.000",
*  "SKU": "P0001",
*  "Name": "100 Piece Puzzle",
*  "Category": "Puzzles",
*  "Description": "A puzzle featuring a picture of a puppy.",
*  "TargetUrl": "http://www.example.com/",
*  "ImageUrl": "http://content.commissionfactory.com.au/Products/0/1.jpg",
*  "Image50Url": "http://content.commissionfactory.com.au/Products/0/1@50x50.jpg",
*  "Image100Url": "http://content.commissionfactory.com.au/Products/0/1@100x100.jpg",
*  "Image120Url": "http://content.commissionfactory.com.au/Products/0/1@120x120.jpg",
*  "Image200Url": "http://content.commissionfactory.com.au/Products/0/1@200x200.jpg",
*  "Image300Url": "http://content.commissionfactory.com.au/Products/0/1@300x300.jpg",
*  "Image400Url": "http://content.commissionfactory.com.au/Products/0/1@400x400.jpg",
*  "Price": "$10",
*  "Brand": null,
*  "Colour": null,
*  "ContentRating": null,
*  "Currency": null,
*  "DeliveryCost": null,
*  "DeliveryTime": null,
*  "Features": null,
*  "Gender": null,
*  "Genre": null,
*  "Keywords": null,
*  "ModelNumber": null,
*  "Platform": null,
*  "PriceRrp": null,
*  "PriceSale": null,
*  "PromoText": null,
*  "Size": null,
*  "StockLevel": null,
*  "SubCategory": null,
*  "Custom1": null,
*  "Custom2": null,
*  "Custom3": null,
*  "Custom4": null,
*  "TrackingUrl": "https://track.commissionfactory.com.au/p/0/1/",
*  "TrackingCode": "<a href=\"https://track.commissionfactory.com.au/p/0/1/\" rel=\"noindex,nofollow\">100 Piece Puzzle</a>"
*}

#
# This is what we gonna store
#
*Id             => product_id:integer
*DateCreated    => date_created:date
*DateModified   => date_modified:date
*SKU            => sku:string
*Name           => name:string
*Category       => category:string
*Description    => description:text
*TargetUrl      => target_url:text
*ImageUrl       => image_url:text
*Image200Url    => avatar_url:text
*Price          => price:integer
*Brand          => barnd:string
*Colour         => colour:string
*Currency       => currency:string
*Gender         => gender:string


Database import
---------------
#
# We are using activerecord-import gem for this. 
# https://github.com/zdennis/activerecord-import
#
Merchant.import([Merchant.new(name: :name), Merchant.new(name: :name)])