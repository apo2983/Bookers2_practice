class FavoritesController < ApplicationController

	def create
		@books =  Book.all
		@book = Book.find(params[:book_id])
		user = @book.user
		@user_books = user.books
		favorite = current_user.favorites.new(book_id: @book.id)
		favorite.save
	end

	def destroy
		@books =  Book.all
		@book = Book.find(params[:book_id])
		user = @book.user
		@user_books = user.books
		favorite = current_user.favorites.find_by(book_id: @book.id)
		favorite.destroy
	end
		
end
