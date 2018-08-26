class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @kadai_tasklist = current_user.kadai_tasklists.build  # form_for 用
      @kadai_tasklists = current_user.kadai_tasklists.order('created_at DESC').page(params[:page])
    end
  end
end