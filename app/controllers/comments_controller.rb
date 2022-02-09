# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to post_path(id: comment.post.id), notice: 'The comment was created successfully'
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :post_id)
  end
end
