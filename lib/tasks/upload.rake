desc "Upload Music and Art"
require 'mp3info'

task :upload => :environment do
  Dir['public/mp3/**/*.{mp3}'].each do |mp3|
    Mp3Info.open(mp3) do |track|
    mp3.gsub(/[^a-z]/i, "")
    mp3["public"]= ""
    if Music.exists?(file_location: mp3)
      nil
    else
      Music.create(file_location: mp3,
                    artist: track.tag.artist,
                    album: track.tag.album,
                    track_no: track.tag.tracknum,
                    title: track.tag.title,
                    year: track.tag.year,
                    genre: track.tag.genre)
    end
  end
end


Dir['public/covers/*.{jpg}'].each do |cover|
  cover.gsub(/[^a-z]/i, "")
  cover["public/covers/"]= ""
  album = cover[0...-4]
  if Art.exists?(art: cover)
    nil
  else
    Art.create(album: album,
                  art: cover)
  end
end
end
