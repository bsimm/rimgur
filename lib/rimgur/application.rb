module RImgur
  class Application
    def initialize(argv)
      @options, @path = parse_options(argv)

      @client = RImgur::Client.new(@options, @path)
    end

    def run
      @client.download_album 
    end

    def parse_options(argv)
      options = {}
      parser = OptionParser.new

      parser.on("-c", "--client_id CLIENT_ID") { |id| options[:client_id] = id }
      parser.on("-a", "--album_id ALBUM_ID") { |id| options[:album_id] = id }

      path = parser.parse(argv)
      
      [options,path]
    end

  end
end
