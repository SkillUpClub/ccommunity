class AddPostcodeAndCoordinatesToUser < ActiveRecord::Migration
  def change
    add_column :users, :postcode, :string
    add_column :users, :longtitude, :string
    add_column :users, :latitude, :string
  end
end
