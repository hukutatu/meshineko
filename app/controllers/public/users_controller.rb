class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
   @dishes = Dish.all.sample(3)
  end

  def show
     @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to  public_user_path(@user)
    else
      render "edit"
    end
  end
  
  def withdrawal
    @customer = current_user
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "今まで利用してくれてありがとうにゃ〜"
  end


  private

  def user_params
    params.require(:user).permit(:name,:email,:get_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to public_user_path(current_user)
    end
  end
end