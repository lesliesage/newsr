class Search < ApplicationRecord
    validate :search_within_30_days
    def search_within_30_days
        if search_date + 30 < Date.today
            errors.add(:search_date, "The articles search is restricted to the last 30 days.")
        end
    end
end
