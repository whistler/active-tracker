module ActiveTracker
  class Tracker
    include Singleton

      # Hold information on what to track
      attr_accessor :hits
      attr_accessor :changes
      attr_accessor :creates

      # Stores blocks called when an event is triggered
      attr_accessor :trackers
      attr_accessor :tracker_names

      def initialize
        @hits = {}
        @changes = {}
        @creates = {}
        @trackers = {}
      end
  end
end