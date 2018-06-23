class Backoffice::CategoryController < BackofficeController
  before_action :authenticate_admin!
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to backoffice_category_index_path
    else
      render :new
    end
  end
  
  
  private
  
  def category_params
    params.require(:category).permit(:description, :avatar)
  end

end