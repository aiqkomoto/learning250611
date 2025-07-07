class Music < ApplicationRecord
    validates :name, :performer, presence: true
    validates :description, length: { maximum: 1000 }
end
