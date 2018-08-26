class KadaiTasklistsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
     @kadai_tasklist = current_user.kadai_tasklists.build(kadai_tasklist_params)
    if @kadai_tasklist.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @kadai_tasklists = current_user.kadai_tasklists.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @kadai_tasklist.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)

  end
  
   private

  def kadai_tasklist_params
    params.require(:kadai_tasklist).permit(:content)
  end
  
  def correct_user
    @kadai_tasklist = current_user.kadai_tasklists.find_by(id: params[:id])
    unless @kadai_tasklist
      redirect_to root_url
    end
  end
end
