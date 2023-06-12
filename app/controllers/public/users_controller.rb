class Public::UsersController < ApplicationController

  def index
   @dishes = Dish.all.sample(3)
  end

  def show
     @user = User.find(params[:id])
  end
  
  def edit
    
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:image)
  end
end
