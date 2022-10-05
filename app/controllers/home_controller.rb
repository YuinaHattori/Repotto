class HomeController < ApplicationController
  before_action :authenticate_user, {only: [:index]}
  before_action :forbid_login_user, {only: [:top]}

  def top
  end
  
  def about
  end

  def index
  end
end
