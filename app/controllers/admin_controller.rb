class AdminController < ApplicationController

  before_action :is_admin
  def index
    @users = User.all
    @article_count = Article.count
    @list_count = List.count
    @item_count = Item.count
  end

  def promote
    @user = User.find(params[:id])
    @user.update_attribute(:is_admin, true)
  end

  def user_details
    @user = User.find(params[:id])
  end

  def lock_user
    @user = User.find(params[:id])
    @user.lock_access!
  end

  def unlock_user
    @user = User.find(params[:id])
    @user.unlock_access!
  end


  private
    def is_admin
      redirect_to "/404.html" unless user_signed_in? and current_user.is_admin
    end
end
