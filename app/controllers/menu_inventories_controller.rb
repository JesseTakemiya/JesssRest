class MenuInventoriesController < ApplicationController
  before_action :set_menu_inventory, only: %i[ show edit update destroy ]

  # GET /menu_inventories or /menu_inventories.json
  def index
    @menu_inventories = MenuInventory.all
  end

  # GET /menu_inventories/1 or /menu_inventories/1.json
  def show
  end

  # GET /menu_inventories/new
  def new
    @menu_inventory = MenuInventory.new
  end

  # GET /menu_inventories/1/edit
  def edit
  end

  # POST /menu_inventories or /menu_inventories.json
  def create
    @menu_inventory = MenuInventory.new(menu_inventory_params)

    respond_to do |format|
      if @menu_inventory.save
        format.html { redirect_to menu_inventory_url(@menu_inventory), notice: "Menu inventory was successfully created." }
        format.json { render :show, status: :created, location: @menu_inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_inventories/1 or /menu_inventories/1.json
  def update
    respond_to do |format|
      if @menu_inventory.update(menu_inventory_params)
        format.html { redirect_to menu_inventory_url(@menu_inventory), notice: "Menu inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_inventories/1 or /menu_inventories/1.json
  def destroy
    @menu_inventory.destroy

    respond_to do |format|
      format.html { redirect_to menu_inventories_url, notice: "Menu inventory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_inventory
      @menu_inventory = MenuInventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_inventory_params
      params.require(:menu_inventory).permit(:quantity_required, :menu_id, :inventory_id)
    end
end
