class Music < ApplicationRecord
    validates :name, :performer, presence: true
    validates :description, length: { maximum: 1000 }
    scope :search_by_keyword, ->(keyword) {
        if keyword.present?
            where(
            "name LIKE :kw OR performer LIKE :kw OR lyricist LIKE :kw OR composer LIKE :kw OR arranger LIKE :kw",
            kw: "%#{sanitize_sql_like(keyword)}%"
            )
        else
            all
        end
    }
end
