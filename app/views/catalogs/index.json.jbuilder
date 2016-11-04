json.array!(@catalogs) do |catalog|
  json.extract! catalog, :id, :file_locatoin, :artist, :album_artist, :album, :track_number, :title, :cover
  json.url catalog_url(catalog, format: :json)
end
