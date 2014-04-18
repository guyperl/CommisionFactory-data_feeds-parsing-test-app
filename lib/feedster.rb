require 'openssl'
require 'net/http'
require 'uri'
require 'openssl'
require 'json'

class Feedster
  def initialize(product, provider='CF')
    @product  = product
    @provider = provider
  end

  #
  # sends get requiest and returns list of products
  #
  def get_merchants
    uri = build_uri_for(@provider)
    p uri
    http = initialize_http(uri)

    request = Net::HTTP::Get.new(uri.request_uri)
    http.request(request)
  end

  #
  # sends get request and returns list of data feeds
  #
  def get_data_feeds(merchant_id)
    uri = build_uri_for(@provider, {id: merchant_id})
    http = initialize_http(uri)

    request = Net::HTTP::Get.new(uri.request_uri)
    http.request(request)
  end

  #
  # generate common uri to docusign service
  #
  def build_uri_for(provider, args={})
    args = args.inject('?'){ |res, hash| res += "#{hash[0]}=#{hash[1]}&" }
    p args
    case provider
    when 'CF'
      URI.parse("https://api.commissionfactory.com.au/V1/Affiliate/DataFeeds/#{args}apiKey=7fec5f11e26a493a8360175035c0014e")
    end
  end

  #
  # initialize instance of Net::HTTP(An HTTP client API)
  #
  def initialize_http(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end
end