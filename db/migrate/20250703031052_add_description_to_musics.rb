class AddDescriptionToMusics < ActiveRecord::Migration[8.0]
  def change
    add_column :musics, :description, :text
  end
end
