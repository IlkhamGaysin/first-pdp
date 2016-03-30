class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :article, index: true, foreign_key: true, null: false
    end
  end
end
