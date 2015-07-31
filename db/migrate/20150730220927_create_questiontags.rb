class CreateQuestiontags < ActiveRecord::Migration
  def change
    create_table :questiontags do |t|
      t.integer :question_id, null: false
      t.integer :tag_id, null: false

      t.timestamps null: false
    end
  end
end
