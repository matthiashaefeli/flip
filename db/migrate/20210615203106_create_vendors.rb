class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :address
      t.string :telephone1
      t.string :telephone2
      t.string :telephone3

      t.timestamps
    end
  end
end
