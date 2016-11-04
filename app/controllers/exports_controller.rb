class ExportsController < ApplicationController
  def index
  end

  def index_musics
    musics = Music.first(100)
    @job = Delayed::Job.enqueue ExportJob.new(musics, musics.count)
  end
end
