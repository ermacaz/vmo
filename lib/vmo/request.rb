module Vmo
  class Request < Vmo::Base
    BASE_URL = 'https://api.vimeo.com'

    def self.get_user(token)
      @token = token
      response = JSON.parse(get_request('/me').body)
      name = response['name']
      link = response['link']
      id   = /(\d+)/.match(response['uri'])[0]
      videos = []
      vid_response = JSON.parse(get_request('/me/videos').body)['data']
      vid_response.each do |video|
        vid_id = /(\d+)/.match(video['uri'])[0]
        vid_name = video['name']
        vid_link = video['link']
        vid_description = video['description']
        vid_created_time = video['created_time']
        vid_embed_url = /https:\/\/player.vimeo.com\/video\/(\d+)/.match(video['embed']['html'])[0]
        vnew = Vmo::Video.new(vid_id, vid_name, vid_description, vid_created_time, vid_embed_url, vid_link)
        videos << vnew
      end
      Vmo::User.new(id, name, link, videos)
    end


    def self.post_request(url, options={})
      options = auth_options(options)
      HTTParty.post(BASE_URL + url, options)
    end

    private
      def self.get_request(url, options={})
        options = auth_options(options)
        HTTParty.get(BASE_URL + url, options)
      end
      def self.auth_options(options)
        options[:headers] = {'Authorization' => "Bearer #{@token}" }
        options
      end
  end
end