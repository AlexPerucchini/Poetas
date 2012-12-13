class Admin::UsersController < AdminController
  
  def index
    #@users = User.not_deleted(params[:page]).per(10) 
    @users = User.all
    @deleted_users = User.deleted
    respond_with(@user)
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
     #respond_with(@user, :location => admin_users_path)
  end
end
