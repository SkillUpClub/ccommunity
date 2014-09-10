class CreateUsersCourses < ActiveRecord::Migration
  def change
    create_table :users_courses do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
    end
  end
end
