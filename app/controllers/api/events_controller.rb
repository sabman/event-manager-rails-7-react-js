class Api::EventsController < ApplicationController
  # CRUD controller for Events API
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /api/events
  def index
    @events = Event.all
    render json: @events
  end

  # GET /api/events/1
  def show
    render json: @event
  end

  # POST /api/events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/events/1
  def destroy
    @event.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(
      :id,
      :event_type,
      :event_date,
      :title,
      :speaker,
      :host,
      :published,
      :created_at,
      :updated_at
    )
  end
end
