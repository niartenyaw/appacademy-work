class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new

  end

  def create
    @book = Book.new
    @book.title = params['book']['title']
    @book.author = params['book']['author']
    @book.save

    redirect_to action: 'index'
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to action: 'index'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
