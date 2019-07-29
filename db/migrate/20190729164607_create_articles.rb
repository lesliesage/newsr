class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :blurb
      t.string :url
      t.string :img_url

      t.timestamps
    end
  end
end
