class ListsController < ApplicationController
    before_action :authenticate_user
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

    def ensure_correct_user
        @list = List.find_by(id: params[:id])
        if @current_user.id != @list.user_id
            flash[:notice] = "権限がありません"
            redirect_to("/lists/index")
        end
    end

    def index
        @user = User.find_by(id: @current_user.id)
        @lists = List.where(user_id: @user.id)
    end

    def new
        @list = List.new
    end

    def create
        @list = List.new(
            content: params[:content],
            user_id: @current_user.id
            )
        @list.save
        redirect_to("/lists/index")
    end

    def edit
        @list = List.find_by(id: params[:id])
    end

    def update
        @list = List.find_by(id: params[:id])
        @list.content = params[:content]
        @list.save
        redirect_to("/lists/index")
    end

    def destroy
        @list = List.find_by(id: params[:id])
        @list.destroy
        redirect_to("/lists/index")
    end


end