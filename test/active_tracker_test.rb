require 'test_helper'

class ActiveTrackerTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, ActiveTracker
  end

  test "active tracker is a singleton" do
    ActiveTracker::Tracker.included_modules.include?(Singleton)
  end
end
