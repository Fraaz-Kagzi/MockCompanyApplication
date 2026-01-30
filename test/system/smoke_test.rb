require "application_system_test_case"

class SmokeTest < ApplicationSystemTestCase
  test "can visit jobs page" do
    visit jobs_path
    assert_text "Jobs"
  end
end
