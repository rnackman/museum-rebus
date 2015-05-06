class RebusesController < ApplicationController
  before_action :set_rebus, only: [:show, :edit, :update, :destroy]

  # GET /rebuses
  # GET /rebuses.json
  def index
    @rebuses = Rebus.all
  end

  # GET /rebuses/1
  # GET /rebuses/1.json
  def show
  end

  # GET /rebuses/new
  def new
    @rebus = Rebus.new
  end

  # GET /rebuses/1/edit
  def edit
  end

  # POST /rebuses
  # POST /rebuses.json
  def create
    @rebus = Rebus.create(input_text: params[:rebus][:input_text]) 
    word_array = params['rebus']['input_text'].split(' ')
    word_array.each do |word|
      Word.create(rebus_id: @rebus.id, display_text: word)
    end

    respond_to do |format|
      if @rebus.save
        format.html { redirect_to @rebus, notice: 'Rebus was successfully created.' }
        format.json { render :show, status: :created, location: @rebus }
        format.js
      else
        format.html { render :new }
        format.json { render json: @rebus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rebuses/1
  # PATCH/PUT /rebuses/1.json
  def update
    respond_to do |format|
      if @rebus.update(rebus_params)
        format.html { redirect_to @rebus, notice: 'Rebus was successfully updated.' }
        format.json { render :show, status: :ok, location: @rebus }
      else
        format.html { render :edit }
        format.json { render json: @rebus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rebuses/1
  # DELETE /rebuses/1.json
  def destroy
    @rebus.destroy
    respond_to do |format|
      format.html { redirect_to rebuses_url, notice: 'Rebus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rebus
      @rebus = Rebus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rebus_params
      params.require(:rebus).permit(:input_text)
    end
end
