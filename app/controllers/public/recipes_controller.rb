class Public::RecipesController < ApplicationController

  def new
    @recipes = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to public_recipes_path
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def favorite_recipes
    recipe_ids = Favorite.where(user_id: params[:user_id]).pluck(:recipe_id)
    @favorite_recipes = Recipe.where(id: recipe_ids)
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :image, :capion)
  end

end
