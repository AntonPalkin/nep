class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy, :confirm, :pay, :err, :hold]


  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill
    @bills = Bill.all
    @bills = Bill.where(type_of_bill_id: params[:type_of_bill].to_i) if params[:type_of_bill]
    @bills = Bill.where(list_id:         params[:list_id].to_i )     if params[:list_id]
    @count = @bills.count

  end
  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new

  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create

    bill_params[:type_id] = Ioe.find(bill_params[:ioe_id]).type_id
    @bill                 = Bill.new(bill_params)

    if bill_params[:list_id] == "2"
      @bill.type_of_bill_id = 3
    else
      @bill.type_of_bill_id = 1
    end
    @bill.paid            = 0
    @bill.user_id         = current_user.id

    respond_to do |format|
      if @bill.save
        format.html { redirect_to bills_url, notice: 'Счет успешно создан.' }
        format.json { render :show, status: :created, location: @bill }
        log(current_user.id,"Создал счет","")
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    @bill.type_of_bill_id = 1
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to bills_url, notice: 'Счет успешно обновлен.' }
        format.json { render :show, status: :ok, location: @bill }
        log(current_user.id,"Обновил счет","")
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    if Transaction.where(bill_id: @bill.id).blank?
      @bill.destroy
      respond_to do |format|
        format.html { redirect_to bills_url, notice: 'Счет удален' }
        format.json { head :no_content }
      end
      log(current_user.id,"Удалил счет","")
     end
  end

  def confirm
    @bill.type_of_bill_id = 3
    @bill.save
    redirect_to action: "index"
  end

  def pay
    if request.post?
      @transaction = Transaction.new
      @bill.paid = @bill.paid + params[:sum].to_i

      @from_comp = Comp.find(@bill.to_comp_id)
      @in_comp   = Comp.find(@bill.from_comp_id)

      @transaction.bill_id = @bill.id
      @transaction.sum     = params[:sum].to_i

      @transaction.to_comp_id   = @in_comp.id
      @transaction.from_comp_id = @from_comp.id

      @transaction.old_balance_in   = @in_comp.balance if @in_comp.comp_type_id == 2
      @transaction.old_balance_from = @from_comp.balance if @from_comp.comp_type_id == 2

      @in_comp.balance   = @in_comp.balance - params[:sum].to_i if @in_comp.comp_type_id == 2
      @from_comp.balance = @from_comp.balance + params[:sum].to_i if @from_comp.comp_type_id == 2

      @transaction.new_balance_from = @from_comp.balance
      @transaction.new_balance_in   = @in_comp.balance

      @in_comp.save
      @from_comp.save
      @transaction.save


      if @bill.paid == @bill.sum
        @bill.type_of_bill_id = 4
      elsif @bill.paid > @bill.sum
        @bill.type_of_bill_id = 9
      end

      @bill.save
  #   render text: "start #{@bill.sum} - #{@bill.paid}"
      log(current_user.id,"Провел оплату",@transaction.id)
      redirect_to action: "index"
    end
  end

  # def add_salary_bill
  #   @employees = Employee.all
  #   @employees.each do |employee|
  #     Bill.create({
  #         :date => current()
  #         :to_comp_id =
  #
  #                 })
  #   end
  # end

  def err
    @bill.type_of_bill_id = 8
    @bill.save
    redirect_to action: "index"
  end

  def hold
    @bill.type_of_bill_id = 5
    @bill.save
    redirect_to action: "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit!
    end

end
