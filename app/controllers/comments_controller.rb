class CommentsController < ApplicationController
    before_action :authenticate_user

	def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(
            user_id: @current_user.id,
            report_id: params[:report_id],
            comment: params[:comment]
        )
        @comment.save
        redirect_to("/reports/#{params[:report_id]}")
    end



end