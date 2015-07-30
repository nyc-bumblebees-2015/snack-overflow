class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :user_id, null: false
      t.references :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
