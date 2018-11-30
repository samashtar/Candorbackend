class AuthController < ApplicationController

# /login
    def create 
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            payload = {user_id: @user.id}
            token = encode(payload)
            render json: {
                error: false, 
                message: 'signed in',
                token: token,
                user_info: {
                    name: @user.name,
                    coupons: @user.coupons,
                    email: @user.email
                }
            }, status: :accepted
        else 
           render json: {error: true, error_message: 'incorrect email or password'},
           status: :unauthorized
        end 


    end 









end 