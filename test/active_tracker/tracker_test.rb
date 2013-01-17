require 'test_helper'
require 'active_tracker/tracker'

class TrackerTest < ActiveSupport::TestCase
  include ActiveTracker

  def setup
    Singleton.send(:__init__, Tracker)
  end

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

  test "trackers can be defined" do 
    t1 = lambda { puts "hi" }
    t2 = lambda { puts "hi" }

    Tracker.config do 
      trackers :tracker1, :tracker2
      tracker1 &t1
      tracker2 &t2
    end
    assert Tracker.instance.tracker_blocks[:tracker1] == t1
    assert Tracker.instance.tracker_blocks[:tracker2] == t2
  end

  test "hit event can be defined" do
    Tracker.config { hit :welcome, :index, "Visited Homepage", [:tracker1, :tracker2]}
    assert Tracker.instance.hits.keys == [:welcome]
    controller_hash = {:index => {:event => "Visited Homepage", :trackers => [:tracker1, :tracker2]}}
    assert Tracker.instance.hits[:welcome] == controller_hash
  end

  test "change event can be defined" do

  end

  test "create event can be defined" do

  end

end
