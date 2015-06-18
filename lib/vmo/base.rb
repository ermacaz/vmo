module Vmo
  class Base
    include HTTParty
    base_uri 'https://api.vimeo.com'

    def initialize(user_token)
      @token = user_token
    end
  end
end