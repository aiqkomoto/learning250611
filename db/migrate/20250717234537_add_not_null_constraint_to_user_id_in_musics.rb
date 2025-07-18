class AddNotNullConstraintToUserIdInMusics < ActiveRecord::Migration[8.0]
  def change
    change_column_null :musics, :user_id, false
  end
end
