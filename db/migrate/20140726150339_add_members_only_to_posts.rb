class AddMembersOnlyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :members_only, :boolean, default: false
  end
end
