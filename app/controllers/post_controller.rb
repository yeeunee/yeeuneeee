class PostController < ApplicationController
  before_action :authenticate_user!
  before_action :is_writer?, only: [:edit, :update, :delete]
  
  def index
    @posts = Post.page params[:page]
  end
  
  def create
    user = User.find(current_user.id)
    post = user.posts.new
    post.title = params[:input_title]
    post.content = params[:input_content]
    post.save
    
    redirect_to '/'
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    post = Post.find(params[:id])
    post.title = params[:input_title]
    post.content = params[:input_content]
    post.save
    
    redirect_to '/'
  end
  
  def delete
    Post.find(params[:id]).destroy
    
    redirect_to '/'
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
#여기까지는 퍼블릭
private

  def is_writer?
    post = Post.find(params[:id])
    if post.user.id != current_user.id
      redirector_to '/'
    end
  end
end
