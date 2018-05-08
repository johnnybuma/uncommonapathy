class CreateJoinTableArticleArticleCategory < ActiveRecord::Migration[5.2]
  def change
    create_join_table :articles, :article_categories do |t|
      #t.index [:article_id, :article_category_id]
      #t.index [:article_category_id, :article_id]
    end
  end
end
