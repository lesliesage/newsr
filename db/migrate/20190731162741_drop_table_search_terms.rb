class DropTableSearchTerms < ActiveRecord::Migration[5.2]
  def change
    drop_table :search_terms
  end
end
