class HotPepperApi
  include HTTParty
  base_uri 'https://webservice.recruit.co.jp/hotpepper/'

  def initialize(path, service, page)
    uri = base_uri + path
    # @options = { query: { site: service, page: page } }
  end

  def questions
    self.class.get("/2.2/questions", @options)
  end

  def users
    self.class.get("/2.2/users", @options)
  end

  def gourmet(keyword)
    @options = { query: { site: service, page: page } } # keyword
    self.class.get("/gourmet/v1/", @options)
  end

  def shops
  end
end