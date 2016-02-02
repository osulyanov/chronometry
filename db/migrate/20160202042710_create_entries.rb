class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user
      t.string :task_description
      t.date :date
      t.integer :minutes_worked

      t.timestamps null: false
    end
  end
end
