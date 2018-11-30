class UsersController < ApplicationController

  def profile
    token = request.headers["Authorization"].split(' ')[1]
    payload = decode(token)
    user = User.find(payload["user_id"])
    render json: { user: UserSerializer.new(user) }, status: :accepted
    
  end

  def find_or_create_with_facebook
    byebug
    if User.find_by(facebookId: params["facebookId"])
      byebug
      @user = User.find_by(facebookId: params["facebookId"])
      
    else 
      byebug
    @user = User.create(facebookId: params["facebookId"], name:params["name"], password: 'test')
  
    end 
    byebug
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end 

  # Sign Up
  def create
    @user = User.create(name:params["name"], email:params["email"], password:params["password"])
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

 
end