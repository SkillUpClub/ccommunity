class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  # user_announcements_path
  def index
    @user = User.friendly.find(params[:user_id])
    @announcements = @user.announcements
  end

  # new_user_announcement
  def new
    @user = current_user
    @announcement = Announcement.new
  end


  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.user_id = current_user.id
    if @announcement.save
      flash[:success] = "Оповещение создано"
      redirect_to user_announcements_path
    else
      flash[:danger] = "Не удалось создать оповещение"
      render 'new'
    end
  end

  def update
    @user = current_user
    @announcement = Announcement.find(params[:id])
    if @announcement.update_attributes(announcement_params)
      flash[:success] = 'Оповещение изменено'
      redirect_to user_announcements_url
    end
  end

  # user_announcement
  def show
    @announcement = Announcement.find(params[:user_id])
  end

  # edit_user_announcement
  def edit
    @user = current_user
    @announcement = Announcement.find(params[:id])
  end

  private
  def announcement_params
    params.require(:announcement).permit(:expire, :content, :active)
  end
end
