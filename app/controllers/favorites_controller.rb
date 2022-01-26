class FavoritesController < ApplicationController

  # def create
  #   favorite.create(user_id: current_user.id, book_id: params[:id])
  #   redirect_to book_path
  # end

  # def destroy
  #   favorite.find_by(user_id: current_user.id, book_id: params[:id]).destroy
  #   redirect_to book_path
  # end

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_back(fallback_location: root_path)
    # @book_favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
    # @book_favorite.save!
    # redirect_to book_path(params[:book_id])
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
    # @book_favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    # @book_favorite.destroy
    # redirect_to book_path(params[:book_id])
  end

end
