json.extract! music, :id, :name, :performer, :lyricist, :composer, :arranger, :length, :description, :created_at, :updated_at
json.url music_url(music, format: :json)
