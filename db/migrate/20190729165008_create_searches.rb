class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :original_text
      t.integer :search_term_id

      t.timestamps
    end
  end
end
