class CampisController < ApplicationController
  before_action :set_campi, only: [:show, :edit, :update, :destroy]

  # GET /campis
  # GET /campis.json
  def index
    @campis = Campi.all
  end

  # GET /campis/1
  # GET /campis/1.json
  def show
  end

  # GET /campis/new
  def new
    @campi = Campi.new
  end

  # GET /campis/1/edit
  def edit
  end

  # POST /campis
  # POST /campis.json
  def create
    @campi = Campi.new(campi_params)

    respond_to do |format|
      if @campi.save
        format.html { redirect_to @campi, notice: 'Campi was successfully created.' }
        format.json { render action: 'show', status: :created, location: @campi }
      else
        format.html { render action: 'new' }
        format.json { render json: @campi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campis/1
  # PATCH/PUT /campis/1.json
  def update
    respond_to do |format|
      if @campi.update(campi_params)
        format.html { redirect_to @campi, notice: 'Campi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @campi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campis/1
  # DELETE /campis/1.json
  def destroy
    @campi.destroy
    respond_to do |format|
      format.html { redirect_to campis_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campi
      @campi = Campi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campi_params
      params.require(:campi).permit(:nomecampo, :tipocampo)
    end
end
