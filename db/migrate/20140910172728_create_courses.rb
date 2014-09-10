class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.belongs_to :user, index: true
      t.text :description

      t.timestamps
    end
  end
end
