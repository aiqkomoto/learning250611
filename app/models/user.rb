class User < ApplicationRecord
  has_many :musics, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_musics, through: :likes, source: :music

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end