require 'test_helper'
require 'active_tracker/tracker'

class TrackerTest < ActiveSupport::TestCase
  include ActiveTracker

  test "active tracker is a singleton" do
    Tracker.included_modules.include?(Singleton)
  end

  test "initialize events to empty hashes" do
    assert Tracker.instance.hits == {}
    assert Tracker.instance.changes == {}
    assert Tracker.instance.creates == {}
  end

  test "initialize trackers to empty hash" do
    assert Tracker.instance.trackers == {}
  end
end
