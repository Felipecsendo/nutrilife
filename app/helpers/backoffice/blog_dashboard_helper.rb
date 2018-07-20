module Backoffice::BlogDashboardHelper
  
  def updates_by_date
      admins = Admin.all.to_ary
      categories = Category.all.to_ary
      posts = Post.all.to_ary
      ary = ary1+ary2
      ary.sort_by &:created_at
  end

end