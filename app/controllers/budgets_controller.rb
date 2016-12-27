class BudgetsController < ApplicationController

  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show

  end

  def new

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  private
    def set_budget
      @budget = Budget.find(params[:id])
    end

    def budget_params
      params.require(:budget).permit!
    end

end
