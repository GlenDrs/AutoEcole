module Admin
  class Admin::TimeslotsController < ApplicationController
    before_action :authenticate_admin

    def new
    end

    def create
    end

    def destroy
    end
  end

  private
  def authenticate_admin
    unless current_user&.admin
      flash[:error] = "You're not a adminstrator"
      redirect_to root_path
    end
end