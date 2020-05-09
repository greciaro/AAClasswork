class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :answer_choice_id, null: false
      t.integer :user_response_id, null: false
      t.timestamps
    end
    add_index :responses, :answer_choice_id
    add_index :responses, :user_response_id
  end
end
