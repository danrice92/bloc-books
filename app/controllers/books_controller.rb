class BooksController < BlocWorks::Controller
  def welcome
    @book = "Eloquent Ruby"
    render :welcome, other_book: "Shoddy JavaScript"
  end

  def show
    @library = "Example's Library"
    @book = "Eloquent Ruby"
    render :show
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
