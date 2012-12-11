module Admin::UsersHelper
  def deleted_user?(user)
    users = User.deleted
    users.each do |deleted_user|
      return if deleted_user == user
    end
  end
end
