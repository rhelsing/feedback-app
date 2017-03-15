class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :user
      t.text :goals_for_week
      t.text :last_week
      t.text :something_small

      t.timestamps
    end
  end
end
