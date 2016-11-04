class Music < ActiveRecord::Base
  require 'mp4info'
  def self.search(search)
      where("artist LIKE ? OR title LIKE ? OR album LIKE ? OR year LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end

class Artist < ActiveRecord::Base
  has_many :albums
  has_many :titles
end

class Album < Artist
  belongs_to :artist
  has_many :titles
end

class Title < Album
  belongs_to :album
end
