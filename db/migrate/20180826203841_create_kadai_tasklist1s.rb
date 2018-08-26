class CreateKadaiTasklist1s < ActiveRecord::Migration[5.0]
  def change
    create_table :kadai_tasklist do |t|
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
