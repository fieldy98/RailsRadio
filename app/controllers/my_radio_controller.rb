class MyRadioController < ApplicationController
  def index

    @mp3s = Music.limit(20).order("RANDOM()")

  end

  def show
    @mp3s = Music.all
    @artist =  Music.find(params[:artist])

  end

  def new
    require 'mp4info'
    require 'mp3info'
    require 'audioinfo'
    require 'numbers_and_words'
    @mp3s = Music.all
    @music = Music.new
  end
  def create
    @mp3s = Music.find_or_initialize_by(file_location: my_radio_params[:file_location])
    @mp3s.assign_attributes(my_radio_params)
    @music = Music.new(my_radio_params)
    if @music.save
      redirect_to my_radio_path
    end
    @art = Art.find_or_initialize_by(file_location: my_radio_params[:file_location])
    @art.assign_attributes(art_params)
    @artist = Art.new(art_params)
    if @artist.save
      redirect_to my_radio_path
    end
  end


end
    require 'delegate'
class Fixbox1 < DelegateClass(Fixnum)
  def self.[](num); new(num); end
  def decrement; __getobj__ - 1; end
  def decrement!; __setobj__(decrement); end
  def increment; __getobj__ + 1; end
  def increment!; __setobj__(increment); end
end


private
def my_radio_params
  params.require(:music).permit!
end
def art_params
  params.require(:art).permit!
end
