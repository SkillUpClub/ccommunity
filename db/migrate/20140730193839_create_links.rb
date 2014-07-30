class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :address
      t.text :description
      t.boolean :approved, :default => false
      t.integer :category_id

      t.timestamps
    end
  end
end
