class MusicsController < ApplicationController
  def index
        require 'mp3info'
    @artists = Music.all
    @mp3s = Music.all
    @arts = Art.all
    if params[:search]
      @mp3s = Music.search(params[:search]).order("created_at ASC").paginate(:page => params[:page], :per_page => 1000)
    else
    #  @mp3s = Music.page(params[:page]).order(:artist)
      @mp3s = Music.order("created_at ASC").paginate(:page => params[:page], :per_page => 1000)
      #@mp3s, @alphaParams = Music.all.alpha_paginate(params[:letter]){|user| user}
      #@mp3s = Music.alphabetical_group(params[:letter])
    end
    @blah = @mp3s.group_by { |e| e.artist }.map { |k, v| [k, v.group_by { |e| e.album }] }
    render stream: true
  end
  def album
    @mp3s = Music.all
    @artist =  Music.find_each(params[:artist])

  end

  def new
    require 'mp4info'
    require 'mp3info'
    require 'audioinfo'
    @mp3s = Music.all
    @music = Music.new
    @art = Art.new
  end
  def create
    @mp3s = Music.find_or_initialize_by(file_location: my_radio_params[:file_location])
    @mp3s.assign_attributes(my_radio_params)
    @music = Music.new(my_radio_params)
    if @music.save
      redirect_to root_path
    end
  end


end



    require 'delegate'
class Fixbox < DelegateClass(Fixnum)
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
