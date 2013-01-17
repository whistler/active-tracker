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

      def self.config &block
        raise "Active Tracker: Configuration block not provided" unless block_given?
        Tracker.instance.instance_eval &block
      end

      def trackers(*args)
        @tracker_names = args
      end

  end
end