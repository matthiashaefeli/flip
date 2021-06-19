class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :name
      t.integer :contractor_id
      t.integer :condition_id
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :status

      t.timestamps
    end
  end
end
