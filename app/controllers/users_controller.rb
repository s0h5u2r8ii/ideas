class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
    @userIdea = Idea.where(user_id: @user.id)
    @userWork = Work.where(user_id: @user.id)
  	@currentUserEntry=Entry.where(user_id: current_user.id).order("id DESC")
    @userEntry=Entry.where(user_id: @user.id).order("id DESC")
    @usersEntry = Entry.where.not(user_id: current_user.id)
    if @user.id != current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end



  def index
  	@users = User.all
  end

  def destroy
    @users = current_user
    @users.soft_delete
    sign_out(@users)
    redirect_to root_path
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
       @user = User.find(params[:id])
       render :edit
    end
  end

private
    def user_params
    params.require(:user).permit(:user_name,:name,:name_phonetic, :profile_image,:phone_number,:email,:introduction,:idea_id)
    end
end
