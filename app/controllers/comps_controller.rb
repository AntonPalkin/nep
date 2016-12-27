class CompsController < ApplicationController
  before_action :set_comp, only: [:show, :edit, :update, :destroy]

  # GET /comps
  # GET /comps.json
  def index
    @comps = Comp.all
  end

  # GET /comps/1
  # GET /comps/1.json
  def show
    @transactions = Transaction.where("from_comp_id = ? OR to_comp_id = ?", @comp.id, @comp.id)
    @bills = Bill.where("from_comp_id = ? OR to_comp_id = ?", @comp.id, @comp.id)
  end

  # GET /comps/new
  def new
    @comp = Comp.new
  end

  # GET /comps/1/edit
  def edit
  end

  # POST /comps
  # POST /comps.json
  def create
    @comp = Comp.new(comp_params)

    if @comp.comp_type_id == 2
      @comp.save
      render "comps/add_account"
    else
    respond_to do |format|
      if @comp.save
        format.html { redirect_to comps_path, notice: 'Comp was successfully created.' }
        format.json { render :show, status: :created, location: @comp }

        log(current_user.id,"Создал счет",@comp.id)
      else
        format.html { render :new }
        format.json { render json: @comp.errors, status: :unprocessable_entity }
      end
    end
    end

  end

 # def add_account
  #  @comp.upgrade_parametrs(copms_params)
 # end


  # PATCH/PUT /comps/1
  # PATCH/PUT /comps/1.json
  def update
    respond_to do |format|
      if @comp.update(comp_params)
        format.html { redirect_to comps_path, notice: 'Comp was successfully updated.' }
        format.json { render :show, status: :ok, location: @comp }
        log(current_user.id,"Обновил компанию",@comp.id)
      else
        format.html { render :edit }
        format.json { render json: @comp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comps/1
  # DELETE /comps/1.json
  def destroy
     if Transaction.where(from_comp_id: @comp.id).blank? and Transaction.where(to_comp_id: @comp.id).blank?

       Bill.where('to_comp_id=? OR from_comp_id=?',@comp.id,@comp.id).each { |bill| bill.destroy }
  #     Account.where(accountable_id: @comp.id).valid?.first.destroy
       @comp.destroy

       respond_to do |format|
        format.html { redirect_to comps_url, notice: 'Компания и все ее счета удачно удалены' }
        format.json { head :no_content }

       end
      log(current_user.id,"Удалил компанию",@comp.id)
     else
       redirect_to comps_url, notice: 'Не удалось удалить компанию'
     end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comp
      @comp = Comp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comp_params
      params.require(:comp).permit!
    end
end
