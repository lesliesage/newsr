class CreateSearchTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :search_terms do |t|
      t.string :search_text

      t.timestamps
    end
  end
end
