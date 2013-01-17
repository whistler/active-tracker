ActiveTracker
=============

Observes hits on controllers and changes in records for tracking user behaviour
in a Rails application.

Gettings Started
----------------

Install the gem by putting the following in your Gemfile

    gem 'active-tracker'

Create an initializer file ie. config/initialitracker.rb and create a config
block in there. Any code for events or trackers should be within this block.

    ActiveTracker.config do
        # All configuration for events and trackers should be inserted here
    end

Events
------

There are three kinds of events that you can track. A hit to a controller, 
change of a field in a record and creation of a new record.

      # Track hits on a controller
      hit :controller, :action, "Event Name", [:tracker1, :tracker2]

      # Track changes on a model attribute
      change :model_name, :model_attribute, "Event Name", [:tracker1]

      # Track model creation
      create :model_name, "Event Name", [:tracker2]

*"Event Name"* is a name you give to the event you are tracking.

*:tracker1* and *:tracker2* are names given to trackers (see below).

Trackers
--------

A tracker is a block of code that logs the event you want to track in a 
database or to an external service like Google analytics, KISSmetrics or 
Mixpanel. 

First list down the different trackers you want to define.

    trackers :mongo, :google_analytics

Then define   

    mongo do
      Thread.new do
        Track.create!( :referer => @request.referer, :url => @request.url, 
                       :ip => @request.ip, :user_agent => @request.user_agent,
                       :timestamp => Time.now, :user => (@user ? @user.id : nil), 
                       :event => @event, :params => @params, 
                       :record_id => @record.try(:id) )
      end
    end
    

It is a good idea to include this code in a thread to prevent the tracker from
slowing down your application.

### Variables

Within the tracker block there are certain instance variables that provide
details about the event which can be stored.

The following instance variables exist if a controller was hit

*@request* - request in a controller

*@params* - the params passed to the controller

*@user* - the current user (if devise is being used)

Record instance varible exists if a model attribute was changed

*@record* - the record that was changed

*@event* - the name of event is always present

Credits
-------

A big thank you to Venio where this gem originates.