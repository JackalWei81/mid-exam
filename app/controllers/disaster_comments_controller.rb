class DisasterCommentsController < ApplicationController

  before_action :set_disaster
  before_action :authenticate_user!


  def edit
    @comment = @disaster.comments.find(params[:id])
  end

  def update
    @comment = @disaster.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Edited successfully!!"
      redirect_to disaster_path(@disaster)
    else
      render :action => :edit
    end
  end


  def create
    @comment = @disaster.comments.build(comment_params)
    flash[:notice] = "New Success!!" if @comment.save
    redirect_to disaster_path(@disaster)
  end

  def destroy
    @comment = @disaster.comments.find(params[:id])
    @comment.destroy
    flash[:alert] = "successfully deleted!!"
    redirect_to disaster_path(@disaster)
  end


  protected

  def set_disaster
    @disaster = Disaster.find(params[:disaster_id])
  end

  def comment_params
    params.require(:comment).permit(:name)
  end
end
