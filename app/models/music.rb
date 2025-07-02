class Music < ApplicationRecord
    validates :name, :performer, presence: true
end
