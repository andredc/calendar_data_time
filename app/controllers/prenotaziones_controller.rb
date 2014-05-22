#class PrenotazionesController < ApplicationController
#before_action :set_prenotazione, only: [:show, :edit, :update, :destroy]

  # GET /prenotaziones
  # GET /prenotaziones.json
  #def index
    #@prenotaziones = Prenotazione.all
    # end

  # GET /prenotaziones/1
  # GET /prenotaziones/1.json
  #def show
    # end

  # GET /prenotaziones/new
  #def new
    #@prenotazione = Prenotazione.new
    #end

  # GET /prenotaziones/1/edit
  #def edit
    # end

  # POST /prenotaziones
  # POST /prenotaziones.json
  #def create
    #@prenotazione = Prenotazione.new(prenotazione_params)

    #respond_to do |format|
      # if @prenotazione.save
        #format.html { redirect_to @prenotazione, notice: 'Prenotazione was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @prenotazione }
        #else
        #format.html { render action: 'new' }
        # format.json { render json: @prenotazione.errors, status: :unprocessable_entity }
        #end
      # end
    # end

  # PATCH/PUT /prenotaziones/1
  # PATCH/PUT /prenotaziones/1.json
  #def update
    # respond_to do |format|
      #  if @prenotazione.update(prenotazione_params)
        #format.html { redirect_to @prenotazione, notice: 'Prenotazione was successfully updated.' }
        #format.json { head :no_content }
        # else
        #format.html { render action: 'edit' }
        #format.json { render json: @prenotazione.errors, status: :unprocessable_entity }
        #end
      # end
    #end

  # DELETE /prenotaziones/1
  # DELETE /prenotaziones/1.json
  #def destroy
    #@prenotazione.destroy
    #respond_to do |format|
      # format.html { redirect_to prenotaziones_url }
      #format.json { head :no_content }
      # end
    # end

  # private
    # Use callbacks to share common setup or constraints between actions.
    #   def set_prenotazione
      #    @prenotazione = Prenotazione.find(params[:id])
      #  end
    #
    # Never trust parameters from the scary internet, only allow the white list through.
    #    def prenotazione_params
      #params.require(:prenotazione).permit(:nome, :Pdata, :Pgiorno, :Pora)
      #end
    #  end
#controller professore con variabili sostituite
  class PrenotazionesController < ApplicationController
    before_action :set_prenotazione, only: [:show, :edit, :update, :destroy]




    # GET /car_repair_reservations
    # GET /car_repair_reservations.json
    def index
      @prenotaziones = Prenotazione.all
    end

    # GET /car_repair_reservations/1
    # GET /car_repair_reservations/1.json
    def show
    end

    # GET /car_repair_reservations/new
    def new

      @reservation = Prenotazione.select('Pgiorno, count(Pgiorno) as nres') .group('Pgiorno') .having('count(Pgiorno) >= ?', 1) .order('Pgiorno asc')
      @slot = Prenotazione.select('Pgiorno, Pora' ) .order('Pgiorno asc') .order('Pora desc')

      def no_prenot
        sum=0.0
        @reservation.each {|res| sum+= 1}
        sum
      end
      @nc = no_prenot



      @prenotazione = Prenotazione.new
    end

    # GET /car_repair_reservations/1/edit
    def edit
      @reservation = Prenotazione.select('Pgiorno, count(Pgiorno) as nres') .group('Pgiorno') .having('count(Pgiorno) >= ?', 1) .order('Pgiorno asc')
      @slot = Prenotazione.select('Pgiorno, Pora' ) .order('Pgiorno asc') .order('Pora asc')
    end

    # POST /car_repair_reservations
    # POST /car_repair_reservations.json
    def create
      @prenotazione = Prenotazione.new(prenotazione_params)

      respond_to do |format|
        if @prenotazione.save
          format.html { redirect_to @prenotazione, notice: 'prenotazione was successfully created.' }
          format.json { render action: 'show', status: :created, location: @prenotazione }
        else
          format.html { render action: 'new' }
          format.json { render json: @prenotazione.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /car_repair_reservations/1
    # PATCH/PUT /car_repair_reservations/1.json
    def update
      respond_to do |format|
        if @prenotazione.update(prenotazione_params)
          format.html { redirect_to @prenotazione, notice: 'prenotazione was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @prenotazione.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /car_repair_reservations/1
    # DELETE /car_repair_reservations/1.json
    def destroy
      @prenotazione.destroy
      respond_to do |format|
        format.html { redirect_to prenotaziones_url }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_prenotazione
      @prenotazione = Prenotazione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prenotazione_params
      params.require(:prenotazione).permit(:nome, :Pdata, :Pgiorno, :Pora)
    end


  end


 #parte della connesione al server
