class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :option, :update, :destroy, :follow, :unfollow]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    # @microposts = Micropost.all.order(created_at: :desc)
    @comments = @user.comments.order(created_at: :desc)
    @likes = Like.where(user_id: @user.id).order(created_at: :desc)
  end

  def picture

  end

  def option
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "プロフィール編集しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "アカウントを削除しました。"
    redirect_to root_url
  end

  def follow
    @user = User.find(params[:id])
    #ログイン中のユーザーで対象のユーザー(@user)をフォローする
    current_user.follow(@user)
    redirect_to user_url(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    #ログイン中のユーザーで対象のユーザー(@user)をフォロー解除する
    current_user.stop_following(@user)
    redirect_to user_url(@user)
  end

  def follow_list
    @user = User.find(params[:id])
    @users = @user.all_following
  end

  def follower_list
    @user = User.find(params[:id])
    @users = @user.followers
  end

  private

    def user_params
        params.require(:user).permit(:name, :email, :introduction, :image_name, :remove_image_name, :password,
                                     :password_confirmation)
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
