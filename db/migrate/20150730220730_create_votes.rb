class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true, index: true
      t.integer :user_id, null: false
      t.integer :value

      t.timestamps null: false
    end
  end
end
