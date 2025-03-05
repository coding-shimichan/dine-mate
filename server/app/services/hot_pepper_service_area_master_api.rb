class HotPepperServiceAreaMasterApi
  include HTTParty
  base_uri "https://webservice.recruit.co.jp/hotpepper/service_area/v1/?key=#{Rails.application.credentials.Hot_Pepper_API_key}&format=json"

  def initialize(service, page)
    @options = { query: { site: service, page: page } }
  end

  def questions
    self.class.get("/", @options)
  end

  def users
    self.class.get("/2.2/users", @options)
  end
end