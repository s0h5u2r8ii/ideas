class AdminUsersController < ApplicationController
  def index
      @users = User.page(params[:page]).per(15)
      @users = @users.search(s_title: params[:s_title]) if params[:s_title].present?
  end


  def show

  	@user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "User was successfully updated."
       redirect_to admin_user_path(@user.id)
    else
      flash[:notice] = "!!User was <not> successfully updated.!!"
       redirect_to admin_user_path(@user.id)
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.soft_delete
    sign_out(@user)
    redirect_to admin_users_path
    else
      render :show
    end
  end

	private

  def user_params
      params.require(:user).permit(:user_name, :user_name_phonetic, :postal_code, :address, :phone_number, :email )
  end


  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end

  def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

end
