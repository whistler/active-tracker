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

  test "tracker names are loaded" do
    Tracker.config { trackers :tracker1, :tracker2}
    Tracker.instance.tracker_names == [:tracker1, :tracker2]
  end

  test "configuration block not provided" do
    assert_raise(RuntimeError) { Tracker.config }
  end

end
