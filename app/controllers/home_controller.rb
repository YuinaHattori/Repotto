class HomeController < ApplicationController
  before_action :authenticate_user, {only: [:index]}



  
  def about
  end

  def index
    @user = User.find_by(id: @current_user.id)
    @lists = List.where(user_id: @user.id).order(date: :asc)
    @reports = Report.all.order(created_at: :desc).limit(5)
  end
end
