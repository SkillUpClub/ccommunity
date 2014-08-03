class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :title
      t.belongs_to :user

      t.timestamps
    end
  end
end
