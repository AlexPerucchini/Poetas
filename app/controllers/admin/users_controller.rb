class Admin::UsersController < AdminController

  def index
    @total_users = User.count
    @users = User.all
    @deleted_users = User.deleted

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_with(@user, :location => admin_users_path)
  end

  def revive
     @user = User.find(params[:id])
     @user.revive
     redirect_to(admin_users_path)
  end
end
