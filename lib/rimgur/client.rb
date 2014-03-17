module RImgur
  class Client
    def initialize(options, path)
      @client_id = options[:client_id]
      @album_id = options[:album_id]
      @path = path
    end

    def download_album
      url_array.each do |url|
        filename = /(\w+).(jpg|jpeg|png|apng|gif)/.match(url)[0]

        @path.each do |path|
          File.write("#{path}/#{filename}", open(url).read, {mode: "wb"})
        end
      end
    end

    private

    def imgur_data
      headers = { "Authorization" => "Client-ID #{@client_id}"}
      path    = "/3/album/#{@album_id}.json"
      uri     = URI.parse("https://api.imgur.com"+path)
      request = Net::HTTP::Get.new(path, headers)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      response = http.request(request)
      response.body
    end

    def album_json
      JSON.parse(imgur_data)
    end

    def images
      album_json["data"]["images"]
    end

    def url_array
      [].tap do |array|
        images.each do |image|
          array << image["link"]
        end
      end
    end

  end
end
