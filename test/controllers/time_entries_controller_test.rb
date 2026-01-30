require "test_helper"

class TimeEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_entry = time_entries(:one)
    @timesheet = @time_entry.timesheet
  end

  test "should get new" do
    get new_timesheet_time_entry_url(@timesheet)
    assert_response :success
  end

  test "should create time_entry" do
    assert_difference("TimeEntry.count") do
      post timesheet_time_entries_url(@timesheet), params: {
        time_entry: {
          job_id: jobs(:one).id,
          work_date: @time_entry.work_date,
          hours: @time_entry.hours,
          notes: "Test note"
        }
      }
    end

    assert_redirected_to timesheet_url(@timesheet)
  end

  test "should get edit" do
    get edit_timesheet_time_entry_url(@timesheet, @time_entry)
    assert_response :success
  end

  test "should update time_entry" do
    patch timesheet_time_entry_url(@timesheet, @time_entry), params: {
      time_entry: { notes: "Updated note" }
    }
    assert_redirected_to timesheet_url(@timesheet)
  end

  test "should destroy time_entry" do
    assert_difference("TimeEntry.count", -1) do
      delete timesheet_time_entry_url(@timesheet, @time_entry)
    end

    assert_redirected_to timesheet_url(@timesheet)
  end
end
