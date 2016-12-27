class TypeIoesController < ApplicationController
  before_action :set_type_io, only: [:show, :edit, :update, :destroy]

  # GET /type_ioes
  # GET /type_ioes.json
  def index
    @type_ioes = TypeIoe.all
  end

  # GET /type_ioes/1
  # GET /type_ioes/1.json
  def show
  end

  # GET /type_ioes/new
  def new
    @type_io = TypeIoe.new
  end

  # GET /type_ioes/1/edit
  def edit
  end

  # POST /type_ioes
  # POST /type_ioes.json
  def create
    @type_io = TypeIoe.new(type_io_params)

    respond_to do |format|
      if @type_io.save
        format.html { redirect_to type_ioes_url, notice: 'Type ioe was successfully created.' }
        format.json { render :show, status: :created, location: @type_io }
      else
        format.html { render :new }
        format.json { render json: @type_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_ioes/1
  # PATCH/PUT /type_ioes/1.json
  def update
    respond_to do |format|
      if @type_io.update(type_io_params)
        format.html { redirect_to @type_io, notice: 'Type ioe was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_io }
      else
        format.html { render :edit }
        format.json { render json: @type_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_ioes/1
  # DELETE /type_ioes/1.json
  def destroy
    @type_io.destroy
    respond_to do |format|
      format.html { redirect_to type_ioes_url, notice: 'Type ioe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_io
      @type_io = TypeIoe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_io_params
      params.require(:type_ioe).permit(:name, :description)
    end
end
