class CreateTodoitems < ActiveRecord::Migration
  def change
    create_table :todoitems do |t|
      t.string :task_title
      t.string :description
      t.date :due_date
      t.references :todolist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
