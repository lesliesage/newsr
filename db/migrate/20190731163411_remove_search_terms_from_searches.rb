class RemoveSearchTermsFromSearches < ActiveRecord::Migration[5.2]
  def change
    remove_column :searches, :search_term_id
  end
end
