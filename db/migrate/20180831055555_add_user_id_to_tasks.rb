class AddUserIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :user_id, :string
    t.references :user, foreign_key: true

    t.timestamps
  end
end
