class Customer::CommentsController < ApplicationController
   before_action :authenticate_customer!
  def create
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:post_id])
    comment = current_customer.comments.new(comment_params)
    comment.post_id = @post.id
    comment.save
    # 通知
    post = comment.post
    post.create_notification_comment(current_customer, comment.id)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:post_id])
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
