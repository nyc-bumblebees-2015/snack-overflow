class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
