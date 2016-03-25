class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
