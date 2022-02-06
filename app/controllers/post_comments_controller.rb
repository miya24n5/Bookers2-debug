class PostCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.book_id = @book.id
    if @comment.save
      render :post_comments
    else
      render 'book/show'
    end

    # redirect_back(fallback_location: root_path)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    @book = Book.find(params[:book_id])
    render :post_comments
    # redirect_back(fallback_location: root_path)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
