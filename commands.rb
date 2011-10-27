FBomb {

##
#
  
  
  command(:hi){
    call do |*args|
      response = %w(
        hi
        howdy
        sup
        hello
        hey
        yo
      )
      speak(response[rand(response.length)])
    end
  }
  
##
#
  command(:youtube){
    setup{ require "google-search" }

    call do |*args|
      msg = ""
      query = CGI.escape(args.join(' ').strip)
      videos = Google::Search::Video.new(:query => query)
      puts "="*45
      puts videos.inspect
      puts "="*45
      @cache ||= []
      if videos.any?
        videos.each do |result|
          uri = CGI.unescape(result.uri)
          match = uri.match(/(http:\/\/www.youtube.com\/watch\?)(.+)/)
          video_id = match[2].split('&').first
          uri = match[1] + video_id
          next if @cache.include? video_id
          @cache << video_id
          msg = "#{ uri }\n"
          break
        end
      else
        msg = "No results for: #{query}"
      end
      speak(msg) unless msg.empty?
    end
  }
  
  
}
