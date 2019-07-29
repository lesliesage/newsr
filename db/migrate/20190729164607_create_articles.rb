class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :blurb
      t.text :url
      t.text :img_url

      t.timestamps
    end
  end
end
