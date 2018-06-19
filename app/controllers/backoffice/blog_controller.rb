class Backoffice::BlogController < BackofficeController
  def index
    @blogs = Blog.all
  end
  
  def new
    #
  end

end