class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:login_form, :login, :new, :create]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

    def ensure_correct_user
      if @current_user.id != params[:id].to_i
          flash[:notice] = "権限がありません"
          redirect_to("/users/index")
      end
    end
  
    def login_form
    end
  
    def login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to("/index")
      else
        @email = params[:email]
          @password = params[:password]
          render("users/login_form")
        end
    end
  
    def logout
      session[:user_id] = nil
      redirect_to("/")
    end

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(
        name: params[:name],
        email: params[:email],
        image_name: "profile.jpg",
        password: params[:password]
      )
      if @user.save
        session[:user_id] = @user.id
        redirect_to("/index")
      else
        render("users/new")
      end
    end

    def show
      @user=User.find(params[:id])
    end

    def edit
      @user = User.find_by(id: params[:id])
    end

    def update
      @user=User.find(params[:id])
      @user.name = params[:name]
      @user.email = params[:email]
      if params[:image]
        @user.image_name = "#{@user.id}.jpg"
        image = params[:image]
        File.binwrite("public/user_images/#{@user.image_name}", image.read)
      end
      @user.save
      redirect_to("/users/#{@user.id}")
    end
  end