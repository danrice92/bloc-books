class LibrariesController < BlocWorks::Controller
  def show
    @library = "Example's Library"
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
