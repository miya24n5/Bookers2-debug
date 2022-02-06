class FavoritesController < ApplicationController

  def create
    # book = Book.find(params[:book_id])
    # favorite = current_user.favorites.new(book_id: book.id)
    # favorite.save
    # redirect_back(fallback_location: root_path)
    # if !Favorite.where(book_id: params[:book_id], user_id: current_user.id).exists?
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    # end
  end

  def destroy
    # book = Book.find(params[:book_id])
    # favorite = current_user.favorites.find_by(book_id: book.id)
    # favorite.destroy
    # redirect_back(fallback_location: root_path)
    # if Favorite.where(book_id: params[:book_id], user_id: current_user.id).exists?
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    # end
  end


end
