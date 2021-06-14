class Customer::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_customer.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    # 通知
    post = comment.post
    post.create_notification_comment(current_customer, comment.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
