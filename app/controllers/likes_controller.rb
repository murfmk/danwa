class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    @like = current_user.likes.create(comment_id: params[:comment_id])
    redirect_back fallback_location: root_path

    respond_to do |format|
      format.html{redirect_to root_url}
      format.js
    end
  end

  def destroy
    like = current_user.likes.find_by(comment_id: params[:comment_id])
    like.destroy
    redirect_back fallback_location: root_path
  end
end
