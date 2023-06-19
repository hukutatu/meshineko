class Public::RecipeCommentsController < ApplicationController
  before_action :ensure_guest_user, only: [:create]

  def create
    recipe = Recipe.find(params[:recipe_id])
    @comment = current_user.recipe_comments.new(recipe_comment_params)
    @comment.recipe_id = recipe.id
    @comment.save
  end

  def destroy
    @comment = current_user.recipe_comments.find(params[:id])
    @comment.destroy
  end

  private

  def recipe_comment_params
    params.permit(:opinion)
  end

  def ensure_guest_user
    @user = current_user
    if @user.name == "guestuser"
      redirect_to public_users_path, notice: 'ゲストユーザーはコメントできません。'
    end
  end

end