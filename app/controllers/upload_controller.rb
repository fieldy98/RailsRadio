class UploadController < ApplicationController
  def index

  end
  def new
  @mp3s = Music.all
  end

  def create
    file = params[:upload]
        ID3Tag::Tag.open(file) do |file|
            unless file.null?
                # properties = fileref.audio_properties
                @music = Music.new(title: tag.title, artist: tag.artist, album: tag.album,
                    year: tag.year, track_no: tag.track_nr, genre: tag.genre)
                if @music.save
                    redirect_to :controller => my_radio
                else
                    render 'new'
                end
            else
                raise "file was null"
            end
        end
      end
end


private
def upload_params
  params.require(:music).permit(:title, :artist, :album, :track_no, :year, :genre) if params[:music]
end
