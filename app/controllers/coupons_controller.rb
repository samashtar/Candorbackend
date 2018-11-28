class CouponsController < ApplicationController
    def index
      render json: Coupon.all
    end
  
    def show
      @coupon = Coupon.find(params[:id])
      render json: @coupon
    end
  
    def create
      @coupon = Coupon.new(coupon_params)
      @coupon.save
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
  