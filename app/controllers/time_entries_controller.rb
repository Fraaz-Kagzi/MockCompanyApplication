class TimeEntriesController < ApplicationController
  before_action :set_timesheet
  before_action :set_time_entry, only: %i[edit update destroy]

  def new
    @time_entry = @timesheet.time_entries.new
  end

  def create
    @time_entry = @timesheet.time_entries.new(time_entry_params)

    if @time_entry.save
      redirect_to @timesheet, notice: "Time entry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @time_entry.update(time_entry_params)
      redirect_to @timesheet, notice: "Time entry was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @time_entry.destroy!
    redirect_to @timesheet, notice: "Time entry was successfully destroyed."
  end

  private

  def set_timesheet
    @timesheet = Timesheet.find(params[:timesheet_id])
  end

  def set_time_entry
    @time_entry = @timesheet.time_entries.find(params[:id])
  end

  def time_entry_params
    params.require(:time_entry).permit(:job_id, :work_date, :hours, :notes)
  end
end
