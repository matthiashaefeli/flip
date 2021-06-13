class CreateConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions do |t|
      t.string :name
      t.integer :status
      t.string :initial_condition
      t.integer :project_id

      t.timestamps
    end
  end
end
