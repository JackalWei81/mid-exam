class DisastersController < ApplicationController

  before_action :find_disaster, :only => [:show, :edit, :update, :destroy]

  def index
    @disasters = Disaster.all
  end

  def show
  end

  def edit
  end

  def update
    if @disaster.update(set_disaster_params)
      flash[:notice] = "Edited successfully!!"
      redirect_to disaster_path(@disaster)
    else
      render :action => :edit
    end
  end

  def new
    @disaster = Disaster.new
  end

  def create
    @disaster = Disaster.new(set_disaster_params)
    if @disaster.save
      flash[:notice] = "New Success!!"
      redirect_to disasters_path
    else
      render :action => :new
    end
  end

  def destroy
    @disaster.destroy
    redirect_to disasters_path
  end


  #inside  method
  protected

  def set_disaster_params
    params.require(:disaster).permit(:name, :description, :category_id)
  end

  def find_disaster
    @disaster = Disaster.find(params[:id])
  end

  def post_time
  end

end
