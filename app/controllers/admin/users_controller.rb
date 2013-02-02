class Admin::UsersController < AdminController

  def index
      #we need to force solr to re-index if the a User was deleted or Activated
    User.reindex
    @search = User.search do
      fulltext params[:search]
    end
    @total_users = User.count
    @users = @search.results
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
