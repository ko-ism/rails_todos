class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :status
      t.date :deadline

      t.timestamps
    end
  end
end
