# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  include ::KaminariApiMetaData

  def index
    @users = User.order(:id).page(params[:page])
    render json: { data: @users, meta: meta_data(@users) }
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
end
