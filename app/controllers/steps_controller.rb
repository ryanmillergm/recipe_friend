class StepsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:format])
    @step = Step.new
  end

  def create
    @recipe = Recipe.find(params[:step][:recipe_id])
    @step = Step.new(step_params)
    if
      @step.step.length > 2 && @step.save
      flash[:success] = "Step #{@recipe.steps.count} has been added to your directions"
      redirect_to new_step_path(@recipe.id)
    elsif
      flash[:error] = "Oops! Something went wrong. Make sure to include a step of directions!"
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipes_facade = RecipeFacade.new(@recipes)
    @ingredient = @recipe.ingredients.first
    if params[:format]
      @step = Step.find(params[:format])
    else
      @step = @recipe.steps.first
    end
  end

  def update
    @step = Step.find(params[:id])
    if @step.update(step_params)
      flash[:success] = "Step has been updated to #{@step.step}"
    else
      redirect_to edit_step_path(@step.recipe_id)
    end
  end

  private

  def step_params
    params.require(:step).permit(:step, :recipe_id)
  end
end
