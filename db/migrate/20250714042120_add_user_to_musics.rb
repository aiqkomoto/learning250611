class AddUserToMusics < ActiveRecord::Migration[8.0]
  def change
    add_reference :musics, :user, foreign_key: true
  end
end
