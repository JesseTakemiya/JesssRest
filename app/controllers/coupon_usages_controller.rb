class CouponUsagesController < ApplicationController
  before_action :set_coupon_usage, only: %i[ show edit update destroy ]

  # GET /coupon_usages or /coupon_usages.json
  def index
    @coupon_usages = CouponUsage.all
  end

  # GET /coupon_usages/1 or /coupon_usages/1.json
  def show
  end

  # GET /coupon_usages/new
  def new
    @coupon_usage = CouponUsage.new
  end

  # GET /coupon_usages/1/edit
  def edit
  end

  # POST /coupon_usages or /coupon_usages.json
  def create
    @coupon_usage = CouponUsage.new(coupon_usage_params)

    respond_to do |format|
      if @coupon_usage.save
        format.html { redirect_to coupon_usage_url(@coupon_usage), notice: "Coupon usage was successfully created." }
        format.json { render :show, status: :created, location: @coupon_usage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coupon_usage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_usages/1 or /coupon_usages/1.json
  def update
    respond_to do |format|
      if @coupon_usage.update(coupon_usage_params)
        format.html { redirect_to coupon_usage_url(@coupon_usage), notice: "Coupon usage was successfully updated." }
        format.json { render :show, status: :ok, location: @coupon_usage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coupon_usage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_usages/1 or /coupon_usages/1.json
  def destroy
    @coupon_usage.destroy

    respond_to do |format|
      format.html { redirect_to coupon_usages_url, notice: "Coupon usage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_usage
      @coupon_usage = CouponUsage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coupon_usage_params
      params.require(:coupon_usage).permit(:date, :customer_id, :order_id, :coupon_id)
    end
end
