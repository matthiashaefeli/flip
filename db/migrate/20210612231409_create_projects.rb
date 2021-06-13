class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :project_type_id
      t.string :name

      t.timestamps
    end
  end
end
