class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :address
      t.string :telephone1
      t.string :telephone2
      t.string :telephone3
      t.integer :status

      t.timestamps
    end
  end
end
