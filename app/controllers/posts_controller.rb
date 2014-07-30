class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  before_filter :check_cd, only: [:create]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.page params[:page]
    
    respond_to do |format|
      format.html
      format.atom
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post_category = Category.all.collect{|c| [c.title, c.id]}
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.create(post_params)
    @post_category = Category.all.collect{|u| [u.title, u.id]}    

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @post.liked_by current_user
    respond_to do |respond|
      respond.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
      @post_category = Category.all.collect{|u| [u.title, u.id]}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :url, :content, :category_id, :members_only)
    end

    def correct_user
      @post = current_user.posts.find_by(url: params[:id])
      redirect_to root_url if @post.nil?
    end

    # Needs to be refactored
    def check_cd 
      unless current_user.posts.empty?
          last_post = current_user.posts.first.created_at
          remaining_time = view_context.distance_of_time_in_words(1.minute.ago, last_post)
        if last_post < 1.minute.ago
          return true
        else
          flash[:danger] = "Вы отправляете посты слишком быстро, попробуйте через #{remaining_time}"
          redirect_to(:back)
        end
      end
    end    
end
