class ChoresController < ApplicationController
  def create
    @home = Home.find(params[:home_id])
    @chore = @home.chores.create(chore_params)
    redirect_to home_path(@home)
  end

  def destroy
    @home = Home.find(params[:home_id])
    @chore = @home.chores.find(params[:id])
    @chore.destroy
    redirect_to home_path(@home)
  end

  private
  def chore_params
    params.require(:chore).permit(:name, :description)
  end
end
