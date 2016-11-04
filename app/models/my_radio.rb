class MyRadio < ActiveRecord::Base
  def self.search(search)
      where("artist LIKE ? OR title LIKE ? OR album LIKE ? OR year LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
