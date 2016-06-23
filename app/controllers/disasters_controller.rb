class DisastersController < ApplicationController

  before_action :find_disaster, :only => [:show, :edit, :update, :destroy]

  before_action :authenticate_user! , :except => [:index, :show]

  def index
    @disasters = Disaster.page( params[:page] ).per(10)
  end

  def show
    @comments = @disaster.comments.page( params[:page] ).per(7)
    @comment = Comment.new
  end

  def edit
    unless current_user == @disaster.user_id
      flash[:alert] = "you are not poster!!"
      redirect_to disasters_path
    end
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
    @disaster.user_id = current_user
    if @disaster.save
      flash[:notice] = "New Success!!"
      redirect_to disasters_path
    else
      render :action => :new
    end
  end

  def destroy
    if current_user == @disaster.user_id
      @disaster.destroy
      flash[:alert] = "successfully deleted!!"
      redirect_to disasters_path(:page => params[:page])
    else
      flash[:alert] = "you are not poster!!"
      redirect_to disasters_path
    end
  end


  #inside  method
  protected

  def set_disaster_params
    params.require(:disaster).permit(:name, :description, :category_id)
  end

  def find_disaster
    @disaster = Disaster.find(params[:id])
  end



end
