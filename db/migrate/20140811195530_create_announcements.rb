class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :content
      t.datetime :expire
      t.boolean :active
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
