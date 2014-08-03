class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :title
      t.belongs_to :trail
      t.belongs_to :user

      t.timestamps
    end
  end
end
