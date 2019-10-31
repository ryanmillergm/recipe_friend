class StepsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:format])
    @step = Step.new
  end
end
