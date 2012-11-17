class Admin::UsersController < AdminController
  
  def index
    #@users = User.not_deleted(params[:page]).per(10) 
    @users = User.not_deleted
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
     respond_with(@user, :location => admin_users_path)
  end
end
