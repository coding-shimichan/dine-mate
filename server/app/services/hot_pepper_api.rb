class HotPepperApi
  include HTTParty
  base_uri 'https://webservice.recruit.co.jp/hotpepper/'

  def initialize
    @auth = {key: Rails.application.credentials.Hot_Pepper_API_key}
  end

  def search_by_keyword(keyword)
    @options = { format: "json", keyword: keyword }
    self.class.get("/gourmet/v1/", query: @options.merge!(@auth))
  end

  def search_by_restaurant_id(id)
    @options = { format: "json", id: id }
    self.class.get("/gourmet/v1", query: @options.merge!(@auth))
  end
end