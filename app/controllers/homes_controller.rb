class HomesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @homes = Home.all
  end

  def show
    @home = Home.find(params[:id])
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)

    if @home.save
      redirect_to @home
    else
      render :new
    end
  end

  def edit
    @home = Home.find(params[:id])
  end

  def update
    @home = Home.find(params[:id])

    if @home.update(home_params)
      redirect_to @home
    else
      render :edit
    end
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy

    redirect_to root_path
  end

  def add_user
    @home = Home.find(params[:id])
    @user = User.find(params[:user_id])

    if @home.users.include? current_user
      flash[:error] = "You are already a part of this home."
    else
      @home.users << @user
    end

    redirect_to @home
  end

  private
  def home_params
    params.require(:home).permit(:name, :description)
  end
end
