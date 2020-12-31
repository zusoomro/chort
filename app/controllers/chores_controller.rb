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

  def assign
    @home = Home.find(params[:id])

    if @home.users.length() == 0
      flash[:error] = "There are no users to assign chores to!"
      redirect_to home_path(@home) and return
    end

    if @home.chores.length() == 0
      redirect_to home_path(@home), notice: "There are no chores to assign!" and return
    end

    count = 0
    print @home.users
    print @home.users.sample
    people = @home.users.sample(@home.chores.length())
    print people
    @home.chores.each do |chore|
      people[count].chores << chore
    end
    
    redirect_to home_path(@home)
  end

  private
  def chore_params
    params.require(:chore).permit(:name, :description)
  end
end
