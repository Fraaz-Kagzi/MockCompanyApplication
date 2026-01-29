class TimeEntriesController < ApplicationController
  before_action :set_timesheet
  before_action :set_time_entry, only: %i[ show edit update destroy ]

  # GET /time_entries or /time_entries.json
  def index
    @time_entries = TimeEntry.all
  end

  # GET /time_entries/1 or /time_entries/1.json
  def show
  end

  # GET /time_entries/new
  def new
    @time_entry = @timesheet.time_entries.new
  end


  # GET /time_entries/1/edit
  def edit
  end

  # POST /time_entries or /time_entries.json
  def create
    @time_entry = @timesheet.time_entries.new(time_entry_params)
    if @time_entry.save
      redirect_to @timesheet, notice: "Time entry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /time_entries/1 or /time_entries/1.json
  def update
    respond_to do |format|
      if @time_entry.update(time_entry_params)
        format.html { redirect_to @time_entry, notice: "Time entry was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @time_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end
  redirect_to @timesheet, notice: "Time entry was successfully updated."


  # DELETE /time_entries/1 or /time_entries/1.json
  def destroy
    @time_entry.destroy!

    respond_to do |format|
      format.html { redirect_to time_entries_path, notice: "Time entry was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end
  redirect_to @timesheet, notice: "Time entry was successfully destroyed."

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_time_entry
    @time_entry = @timesheet.time_entries.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def time_entry_params
    params.require(:time_entry).permit(:job_id, :work_date, :hours, :notes)
  end


  def set_timesheet
    @timesheet = Timesheet.find(params[:timesheet_id])
  end
end
