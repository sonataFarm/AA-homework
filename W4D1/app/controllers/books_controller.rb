class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def create
    new_book = Book.new(book_params)

    if new_book.save
      redirect_to books_url
    else
      render json: new_book.errors.full_messages,
             status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])

    if book.destroy
      render json: book
    else
      render json: "That book is presh yo"
    end

  rescue ActiveRecord::RecordNotFound
    render html: 'That book does not exist'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
