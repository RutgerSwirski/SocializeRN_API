class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all

    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors
    end
  end

  def update
    profile_pic_uri = params[:profile_picture_data][:uri]
    # safe_data = {
    #   cloud_name = 'dsfmdlng2',
    #   api_key = '599491585974218',
    #   api_secret = 'qDOBrbip5mVz6K5juv9KkIVH3_I'
    # }
    result = Cloudinary::Uploader.upload(profile_pic_uri)
      # ENV['CLOUDINARY_URL'])

    # if @user.update(user_params)
    #   render json: @user
    # else
    #   render json: @user.errors
    # end
  end

  def destroy
    @user.destroy
  end

  def set_app_user
    @user = User.find_by(email: params[:email])
    if @user 
      render json: @user
    else
      render json: @user.errors
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :profile_picture_url, :first_name, :last_name, :description)
    end
end
