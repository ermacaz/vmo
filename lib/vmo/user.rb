module Vmo
  class User < Vmo::Base
    attr_accessor :name, :link, :videos

    def initialize(id, name, link, videos)
      @id = id
      @name = name
      @link = link
      @videos = videos
    end

  end
end