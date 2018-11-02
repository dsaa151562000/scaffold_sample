# frozen_string_literal: true

class UserAcountManagesController < ApplicationController
  before_action :basic
  before_action :check_login, only: %i[index edit update]
  before_action :set_user, only: %i[edit update]

  def index
    @q = User.search(params[:q])
    @q.sorts = "id asc" if @q.sorts.empty?
    @users = @q.result(distinct: true).page(params[:page])
    render "index"
  end

  def login_form
    render "login"
  end

  def login
    admin_user = AdminUser.find_by name: params[:name]
    if admin_user&.authenticate(params[:pass])
      session[:admin_user_id] = admin_user.id
      redirect_to action: :index
    else
      flash.now.alert = "もう一度入力してください。"
      render "login"
    end
  end

  def logout
    session[:admin_user_id] = nil
    @admin_current_user = nil
    render "login"
  end

  def edit; end

  def update
    redirect_to action: :index if @user.update(user_params)
  end

  private

  def check_login
    render "login" if session[:admin_user_id].blank?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:account_staus)
  end
end
