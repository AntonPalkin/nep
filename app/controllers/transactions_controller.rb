class TransactionsController < ApplicationController
  before_action :if_user_admin

  def index
    @transactions = Transaction.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params.require(:transaction).permit!
  end


end
