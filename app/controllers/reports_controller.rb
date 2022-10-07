class ReportsController < ApplicationController
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
    before_action :authenticate_user

    def ensure_correct_user
        @report = Report.find_by(id: params[:id])
        if @current_user.id != @report.user_id
            flash[:notice] = "権限がありません"
            redirect_to("/reports/index")
        end
    end

    def index
        @reports = Report.all.order(created_at: :desc)
    end

    def show
        @report = Report.find_by(id: params[:id])
        @user = User.find_by(id: @report.user_id)
        @checks_count = Check.where(report_id: @report.id).count
        @users_count = User.all.count
        @comments = Comment.where(report_id: @report.id)
    end

    def new
        @report = Report.new
    end

    def create
        @report = Report.new(title: params[:title], content: params[:content], user_id: @current_user.id)
        if @report.save
            @check = Check.new(report_id: @report.id, user_id: @current_user.id)
            @check.save
            flash[:notice] = "レポートを投稿しました"
            redirect_to("/reports/index")
        else
            render("reports/new")
        end
    end

    def edit
        @report = Report.find_by(id: params[:id])
    end

    def update
        @report = Report.find_by(id: params[:id])
        @report.content = params[:content]
        if @report.save
            flash[:notice] = "レポートを編集しました"
            redirect_to("/reports/index")
        else
            render("reports/edit")
        end
    end

    def destroy
        @report = Report.find_by(id: params[:id])
        @report.destroy
        flash[:notice] = "レポートを削除しました"
        redirect_to("/reports/index")
    end

end