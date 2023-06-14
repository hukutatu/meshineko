class Public::RecipeCommentsController < ApplicationController


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
end