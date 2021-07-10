class CreateFinances < ActiveRecord::Migration[6.1]
  def change
    create_table :finances do |t|
      t.integer :project_id
      t.string :name
      t.integer :ftype
      t.decimal :quantity

      t.timestamps
    end
  end
end
