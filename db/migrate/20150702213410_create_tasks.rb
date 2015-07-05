class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :body
      t.integer :user_id
      t.timestamps
    end
  end
end
