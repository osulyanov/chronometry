class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [:update, :destroy]

  respond_to :json

  def index
    respond_to do |format|
      format.html
      format.json { render json: current_user.entries.to_json }
    end
  end

  def create
    respond_with current_user.entries.create(entry_params)
  end

  def update
    respond_with @entry.update(entry_params), location: ''
  end

  def destroy
    respond_with @entry.destroy!
  end

  private

  def set_entry
    @entry = current_user.entries.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:date, :minutes_worked, :task_description)
  end
end
