module Vmo
  class Base
    base_uri 'https://api.vimeo.com'

    def initialize(user_token)
      @token = user_token
    end
  end
end