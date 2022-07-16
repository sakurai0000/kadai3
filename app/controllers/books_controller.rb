class BooksController < ApplicationController
  def new
    @book = Book.new
  end

   def create
    @book = Book.new(book_params)
    if @book.save
     flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
     @books =Book.all
     render :index
    end
   end

  def index
     @books = Book.all
     @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
     redirect_to book_path(@book.id)
    else
       @books =Book.find(params[:id])
       render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    flash[:notice] = "successfully"
    redirect_to books_path
    
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
