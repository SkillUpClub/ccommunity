class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new, :create]
  before_action :correct_user,   only: [:edit, :update, :destroy]  
  before_action :set_link, only: [:show, :edit, :update, :destroy, :approve]

  def index
    @links = Link.approved
  end

  def moderate
    @links = Link.not_approved
  end

  def approve
    @link.approved = true
    if @link.update_attributes(approved: true)
      redirect_to @link
    else
      render 'index'
    end
  end

  def show
  end

  def edit
    @categories = Category.all.map{|c| [c.title, c.id]} 
  end

  def update
    if @link.update_attributes(link_params)
      redirect_to @link
    else
      render 'edit'
    end
  end

  def destroy
    if @link.destroy
      redirect_to links_path
      flash[:notice] = "Ссылка успешно удалена"
    end
  end

  def new
    @link = Link.new
    @categories = Category.all.map{|c| [c.title, c.id]}    
  end

  def create
    # govno kakoe-to
    if signed_in?
      @link = current_user.links.create(link_params)
      @link.approved = true
    else
      @link = Link.create(link_params)
    end

    if @link.save
      redirect_to @link
    else
      render 'new'
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :address, :description, :category_id)
  end

  def correct_user
    @link = Link.find(params[:id])
    if @link.user
      @link_for_delete = current_user.links.find_by(id: params[:id])
    else
      return
    end
    redirect_to root_url if @link_for_delete.nil?
  end

  def set_link
    @link = Link.find(params[:id])
  end  
end
