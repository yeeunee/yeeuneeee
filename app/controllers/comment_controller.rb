class CommentController < ApplicationController
  def create
    post = Post.find(params[:id])
    comment = post.comments.new
    comment.text = params [:input_comment]
    comment.user_id = current_user.id
    comment.save
    
    redirect_to :back
  end
  
  def delete
    Comment.find(params[:id]).destroy
    
    redirect_to :back
  end
end
