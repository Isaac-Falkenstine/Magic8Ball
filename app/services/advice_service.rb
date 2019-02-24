class AdviceService

  def search_results(query)
    json = get_json("/advice/search/#{query}")
  end

   def get_json(uri)
    response = conn.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => "https://api.adviceslip.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
