class BookCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		book_comment = current_user.book_comments.new(book_comment_params)
		book_comment.book_id = book.id
		if book_comment.save
			flash[:notice]="コメントしました"
			# redirect_back(fallback_location: books_path)
			redirect_to book_path(book.id)
		else
			flash[:alert]="コメント内が空っぽです"
			redirect_back(fallback_location: books_path)
		end


	end

	def destroy
		book_comment = BookComment.find(params[:id])
		if book_comment.destroy
			flash[:notice]="コメントを削除しました"
			redirect_back(fallback_location: books_path)
		end
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
