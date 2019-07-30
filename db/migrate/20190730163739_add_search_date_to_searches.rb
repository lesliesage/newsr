class AddSearchDateToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :search_date, :date
  end
end
