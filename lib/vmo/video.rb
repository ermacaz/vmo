module Vmo
  class Video < Vmo::Base
    attr_accessor :name, :description, :created_time, :embedUrl
    def initialize(id, name, description, created_time, url)
      @id = id
      @name = name
      @description = description
      @created_time = created_time
      @embedUrl = url
    end
  end
end