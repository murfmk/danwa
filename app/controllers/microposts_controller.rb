class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @micropost = Micropost.new
  end

  def show
    @micropost = Micropost.find(params[:id])
    @comment = Comment.new
    @user = User.find_by(id: @micropost.user_id)
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:notice] = "テーマを投稿しました!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end


  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
     @micropost = current_user.microposts.find_by(id: params[:id])
     redirect_to root_url if @micropost.nil?
   end
end
