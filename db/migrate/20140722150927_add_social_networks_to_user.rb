class AddSocialNetworksToUser < ActiveRecord::Migration
  def change
    add_column :users, :github, :string
    add_column :users, :twitter, :string
    add_column :users, :site, :string
  end
end
