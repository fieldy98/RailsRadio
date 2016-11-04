class PagesController < ApplicationController
  attr_reader :pages_list
  layout "my_custom_layout"

  def self.pages_list
    Dir.glob(
        Rails.root + "D:/dwhite/music/*"
    ).select {|f|
      File.file? f
    }.map {|f|
      File.basename(f)[0..File.basename(f).index(".").to_i-1]
    }.uniq
  end
end
