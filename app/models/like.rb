class Like < ApplicationRecord
  belongs_to :user
  belongs_to :music

  validates :user_id, uniqueness: { scope: :music_id }
end
