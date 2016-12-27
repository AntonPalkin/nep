class IoesController < ApplicationController
  before_action :set_io, only: [:show, :edit, :update, :destroy]
  before_action :if_type_of_ios_empty?

  # GET /ioes
  # GET /ioes.json
  def index
    @ioes = Ioe.all
  end

  # GET /ioes/1
  # GET /ioes/1.json
  def show
  end

  # GET /ioes/new
  def new
    @io = Ioe.new
  end

  # GET /ioes/1/edit
  def edit
  end

  # POST /ioes
  # POST /ioes.json
  def create
    @io = Ioe.new(io_params)

    respond_to do |format|
      if @io.save
        format.html { redirect_to @io, notice: 'Ioe was successfully created.' }
        format.json { render :show, status: :created, location: @io }
      else
        format.html { render :new }
        format.json { render json: @io.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ioes/1
  # PATCH/PUT /ioes/1.json
  def update
    respond_to do |format|
      if @io.update(io_params)
        format.html { redirect_to @io, notice: 'Ioe was successfully updated.' }
        format.json { render :show, status: :ok, location: @io }
      else
        format.html { render :edit }
        format.json { render json: @io.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ioes/1
  # DELETE /ioes/1.json
  def destroy
    @io.destroy
    respond_to do |format|
      format.html { redirect_to ioes_url, notice: 'Ioe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_io
      @io = Ioe.find(params[:id])
    end

    def if_type_of_ios_empty?
      redirect_to type_ioes_url if TypeIoe.all.empty?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def io_params
      params.require(:ioe).permit!
    end
end
