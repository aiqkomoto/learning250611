class CreateMusics < ActiveRecord::Migration[8.0]
  def change
    create_table :musics do |t|
      t.string :name
      t.string :lyricist
      t.string :composer
      t.string :arranger
      t.string :length

      t.timestamps
    end
  end
end
