class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_at, :end_at, :is_all_day, :memo))
    if @schedule.save
      #投稿データが作成できた場合の処理
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :schedules
    else
      #投稿データが作成できなかった場合の処理
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title,:start_at,:end_at,:is_all_day,:memo))
      flash[:notice] = "IDが「#{@schedule.id}」の情報を更新しました"
      redirect_to :schedules
    else
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules, status: :see_other
  end
end
