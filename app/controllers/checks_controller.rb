class ChecksController < ApplicationController
    before_action :authenticate_user

    def create
        @check = Check.new(
            user_id: @current_user.id,
            report_id: params[:report_id]
        )
        @check.save
        redirect_to("/reports/#{params[:report_id]}")
    end

    def destroy
        @check = Check.find_by(
            user_id: @current_user.id,
            report_id: params[:report_id]
        )
        @check.destroy
        redirect_to("/reports/#{params[:report_id]}")
    end

end