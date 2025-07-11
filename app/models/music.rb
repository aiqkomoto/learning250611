class Music < ApplicationRecord
    validates :name, :performer, presence: true
    validates :description, length: { maximum: 1000 }

    SORTABLE_COLUMNS = %w[name performer lyricist composer arranger length].freeze

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

    def self.valid_sort_column(column)
        SORTABLE_COLUMNS.include?(column) ? column : "name"
    end

    def self.valid_sort_direction(direction)
        %w[asc desc].include?(direction) ? direction : "asc"
    end
end
