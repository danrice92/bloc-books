class BooksController < BlocWorks::Controller
  def welcome
    @book = "Eloquent Ruby"
    render :welcome
  end

  def index
    render :index, books: Book.all
  end

  def new
    render :new
  end

  def create
    render :create
  end

  def edit
    render :edit
  end

  def update
    render :update
  end

  def destroy
    render :destroy
  end
end
