class CreateArticleTypes < ActiveRecord::Migration
  def change
    create_table :article_types do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
