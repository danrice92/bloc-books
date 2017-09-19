require 'pry'
require 'pry-stack_explorer'

class BooksController < BlocWorks::Controller
  def welcome
    @book = Book.find(3)
    # uncomment to render welcome page
    return render

    # uncomment to do internal redirect to index
    # return redirect_to :index
  end

  def index
    @books = Book.all
    render
  end

  def google
    # redirect to external url
    book = Book.find(params['id'])
    redirect_to :google, book.name
  end

  def show
    book = Book.find(params['id'])
    render :show, book: book
  end

  def new
    render :new
  end

  def create
    render_partial :create
    @books = Book.all
    render :index
  end

  def edit
    book = Book.find(params['id'])
    render :edit, book: book
  end

  def update
    render_partial :update
    book = Book.find(params['id'])
    render :show, book: book
  end

  def delete
    book = Book.find(params['id'])
    render :delete, book: book
  end

  def destroy
    render_partial :destroy
    @books = Book.all
    render :index
  end
end
