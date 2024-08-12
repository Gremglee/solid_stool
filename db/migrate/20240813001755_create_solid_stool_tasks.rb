class CreateSolidStoolTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :solid_stool_tasks do |t|
      t.string :title, null: false
      t.text :description
      t.references :assigned_to, null: false, foreign_key: { to_table: :users }
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.datetime :due_date
      t.string :priority, default: 'medium'
      t.string :status, default: 'pending'
      t.string :category

      t.timestamps
    end
  end
end
