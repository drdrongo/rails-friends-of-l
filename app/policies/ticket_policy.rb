class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def update?
    user_is_host_or_admin?
  end

  private

  def user_is_host_or_admin?
    record.event.user == user || user.admin
  end
end
