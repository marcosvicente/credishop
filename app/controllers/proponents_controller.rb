class ProponentsController < ApplicationController
  before_action :set_proponent, only: %i[ show edit update destroy ]

  # GET /proponents or /proponents.json
  def index
    @proponents = Proponent.order(:created_at).page(paginate_params[:page]).per(paginate_params[:per_page])
  end

  # GET /proponents/1 or /proponents/1.json
  def show
  end

  # GET /proponents/new
  def new
    @proponent = Proponent.new
    @proponent.build_address
    @proponent.phone.build
  end

  # GET /proponents/1/edit
  def edit
  end

  # POST /proponents or /proponents.json
  def create
    @proponent = Proponent.new(proponent_params)

    if @proponent.save
        redirect_to proponent_url(@proponent), notice: 'Proponent was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /proponents/1 or /proponents/1.json
  def update
    respond_to do |format|
      if @proponent.update(proponent_params)
        format.html { redirect_to proponent_url(@proponent), notice: 'Proponent was successfully updated.' }
        format.json { render :show, status: :ok, location: @proponent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proponents/1 or /proponents/1.json
  def destroy
    @proponent.phone.destroy_all
    @proponent.destroy

    respond_to do |format|
      format.html { redirect_to proponents_url, notice: 'Proponent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proponent
      @proponent = Proponent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proponent_params
      params.require(:proponent).permit(
        :name,
        :cpf,
        :address_id,
        :birth_date,
        :salary,
        address_attributes: [
          :cep,
          :city,
          :neighborhood,
          :number,
          :state,
          :street
        ],
        phone_attributes: [
          :id,
          :number,
          :reference,
          :_destroy
        ])
    end

    def paginate_params
      params.permit(
        :page, :per_page
      )
    end
end
