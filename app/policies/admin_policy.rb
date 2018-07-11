class AdminPolicy < ApplicationPolicy
  
  def new?
    user.full_access?
  end
  
  def destroy?
    user.full_access?
  end
  
  def edit?
    user.full_access? || user.id == record.id
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
