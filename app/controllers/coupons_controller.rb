class CouponsController < ApplicationController
  
    def index
      render json: Coupon.all
    end
  
    def show
      @coupon = Coupon.find(params[:id])
      render json: @coupon
    end
  
    def create
      token = request.headers["Authorization"].split(' ')[1]
      payload = decode(token)
      user = User.find(payload["user_id"])
      @coupon = Coupon.create(info:params["info"].to_json)
      user.coupons << @coupon
      render json: @coupon
      
  end
  
    def update
      @coupon = Coupon.find(params[:id])
      @coupon.update(coupon_params)
      render json: @coupon
    end
  
    def destroy
      @coupon = Coupon.find(params[:id])
      @coupon.destroy
    end
  
    
  
  end
  