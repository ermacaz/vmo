module Vmo
  class Video < Vmo::Base
    attr_accessor :id, :name, :description, :created_time, :embedUrl, :link
    def initialize(id, name, description, created_time, embedUrl, link)
      @id = id
      @name = name
      @description = description
      @created_time = created_time
      @embedUrl = embedUrl
      @link = link
    end
  end
end