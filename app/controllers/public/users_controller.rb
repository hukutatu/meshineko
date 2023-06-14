class Public::UsersController < ApplicationController

  def index
   @dishes = Dish.all.sample(3)
  end

  def show
     @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to  public_user_path(@user)
    else
      render "edit"
    end
  end

 

  private

  def user_params
    params.require(:user).permit(:name,:email,:get_image)
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
