class ExportJob < ProgressJob::Base
  def initialize(musics, progress_max)
    super progress_max: progress_max
    @mp3s = musics
  end

  def perform
    update_stage('Index Music')
    Dir['public/mp3/**/*.{mp3}'].each do |file|
      Mp3Info.open(file) do |mp3|
        file.gsub(/[^a-z]/i, "")
        file["public"]= ""
        if Music.exists?(file_location: file)
          nil
        else
          Music.create(file_location: file,
                          artist: mp3.tag.artist,
                          title: mp3.tag.title,
                          album: mp3.tag.album,
                          year: mp3.tag.year,
                          track_no: mp3.tag.tracknum )
        end

      end
    end

    Dir['public/mp3/**/*.{m4a}'].each do |file|
      mp4 = MP4Info.open(file)
        file.gsub(/[^a-z]/i, "")
        file["public"]= ""
        if Music.exists?(file_location: file)
          nil
        else
          Music.create(file_location: file,
                          artist: mp4.ART,
                          title: mp4.NAM,
                          album: mp4.ALB,
                          year: mp4.DAY,
                          track_no: mp4.TRKN[0] )
        end

    end
  end
end
