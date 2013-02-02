class Admin::UsersController < AdminController

  def index
       @search = User.search do
        fulltext params[:search]
    end
    @users = @search.results
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
