class AddPerformerToMusics < ActiveRecord::Migration[8.0]
  def change
    add_column :musics, :performer, :string
  end
end
