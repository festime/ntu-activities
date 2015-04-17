class ActivitiesController < ApplicationController
  before_action :require_sign_in, only: [:edit, :update]

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new activity_params

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

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update(activity_params)
      flash[:success] = "更新成功！"
      redirect_to activities_path
    else
      flash[:danger] = "欄位有誤，請確認"
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.delete
    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:name).merge(date_hash)
  end

  def date_hash
    { date: Date.strptime("#{params[:date][:year]}-#{params[:date][:month]}-#{params[:date][:day]}", "%Y-%m-%d") }
  end
end
