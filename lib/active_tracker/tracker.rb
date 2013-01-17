module ActiveTracker
  class Tracker
    include Singleton

      # Hold information on what to track
      attr_accessor :hits
      attr_accessor :changes
      attr_accessor :creates

      # Stores blocks called when an event is triggered
      attr_accessor :tracker_blocks
      attr_accessor :tracker_names

      def initialize
        # information is stored in hashes
        @hits = {}
        @changes = {}
        @creates = {}
        @tracker_blocks = {}
      end

      # evaluate the config block
      def self.config &block
        raise "Active Tracker: Configuration block not provided" unless block_given?
        Tracker.instance.instance_eval &block
      end

      # store names of trackers so they can be recognized when defined
      def trackers(*args)
        @tracker_names = args
      end

      def method_missing(m, *args, &block)  
        if @tracker_names.include? m
          # => binding.pry
          @tracker_blocks[m] = block
        else
          super(name, *args, &block)
        end
      end

  end
end