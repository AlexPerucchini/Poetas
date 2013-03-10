module ApplicationHelper
  def admin_only
    current_user.has_role?(:admin)
  end
end
