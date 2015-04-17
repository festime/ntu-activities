class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new activity_params
    @activity.date = "#{params[:date][:year]} #{params[:date][:month]} #{params[:date][:day]}"

    if @activity.save
      flash[:success] = "輸入成功！"
      redirect_to new_activity_path

    else
      flash.now[:danger] = "欄位資料有誤，請確認"
      render :new
    end
  end

  def index
    @activities = Activity.all
  end

  private

  def activity_params
    params.require(:activity).permit(:name)
  end
end
