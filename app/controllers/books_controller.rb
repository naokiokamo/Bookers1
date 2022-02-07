class BooksController < ApplicationController
 def index
    @book = Book.new
    @books = Book.all
 end

 def create
   @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
    flash[:notice] = "Book was successfully created"
 end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    else
      render 'books/edit'
    end
    flash[:notice] = "Book was successfully updated"
  end
  
  def destroy
    flash[:notice] = "Book was successfully destroied"
    @book = Book.find(params[:id]) 
    @book.destroy
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
