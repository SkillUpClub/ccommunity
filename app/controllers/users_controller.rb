class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longtitude
    end
  end

  def show
  end

  private

  def set_user
      @user = User.friendly.find(params[:id])
  end

  def gmaps4rails_title
    
  end
end
