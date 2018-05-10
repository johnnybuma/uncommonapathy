class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.text :topic
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
