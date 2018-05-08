class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.string :slug
      t.text :body
      t.string :keyword

      t.timestamps
    end
  end
end
