class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.boolean :publish_flag
      t.datetime :published_at

      t.timestamps
    end
  end
end
