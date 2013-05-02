// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

function initialize() {
  var eM = new eventManager();
  eM.fillEventArrays();
  eM.instantiateMap();
  eM.extendBounds();
  eM.addHomeMarker();
  eM.addEventMarkers();
}

function eventManager() {
  var that = this;
  that.locs_within_range = [];
  that.locations = [];
  that.map = null;
  that.infoWindow = new google.maps.InfoWindow();
}

eventManager.prototype.fillEventArrays = function() {
  var that = this;

  for (i = 0; i < events_within_range.length; i++) {
    that.locs_within_range[i] = [events_within_range[i]['title'],
        events_within_range[i]['latitude'],
        events_within_range[i]['longitude'],
        events_within_range[i]['id'],
        events_within_range[i]['address'],
        events_within_range[i]['datetime']
    ];
  }

  for (i = 0; i < trimmed_events.length; i++) {
    that.locations[i] = [trimmed_events[i]['title'],
        trimmed_events[i]['latitude'],
        trimmed_events[i]['longitude'],
        trimmed_events[i]['id'],
        trimmed_events[i]['address'],
        trimmed_events[i]['datetime']
    ];
  }
};

eventManager.prototype.instantiateMap = function() {
  var that = this;

  that.map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: new google.maps.LatLng(user_loc[0], user_loc[1]),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
};

eventManager.prototype.addHomeMarker = function() {
  var that = this;

  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(user_loc[0], user_loc[1]),
    icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
    map: that.map
  });

  google.maps.event.addListener(marker, 'click', (function(marker) {
    return function() {
      that.infoWindow.setContent('Home');
      that.infoWindow.open(that.map, marker);
    };
  })(marker, i));
};

// Set map bounds to include all events within range, even if
// filtered out by category
eventManager.prototype.extendBounds = function() {
  var that = this;

  var bounds = new google.maps.LatLngBounds();

  for (var j = 0; j < that.locs_within_range.length; j++) {
    var myLatLng = new google.maps.LatLng(that.locs_within_range[j][1], that.locs_within_range[j][2]);
    bounds.extend(myLatLng);
    that.map.fitBounds(bounds);
  }
};

eventManager.prototype.addEventMarkers = function() {
  var that = this;

  // Add only events of selected categories to map
  for (var i = 0; i < that.locations.length; i++) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(that.locations[i][1], that.locations[i][2]),
      map: that.map
    });

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        that.infoWindow.setContent(that.locations[i][0] + "<br>" +
            that.locations[i][5].substring(0,10) + "<br>" +
            that.locations[i][5].substring(11,16)
        );
        that.infoWindow.open(that.map, marker);
      };
    })(marker, i));

    that.addMousoverListeners(marker, that.locations[i][3]);
  }
};

eventManager.prototype.addMousoverListeners = function(marker, evId) {
  var that = this;

  google.maps.event.addListener(marker, 'mouseover', (function(evId) {
    return function() {
      $('div[data-eventid]').removeClass('highlight');
      $('div[data-eventid="' + evId + '"]').addClass('highlight');
    };
  })(evId));

  google.maps.event.addListener(marker, 'mouseout', (function(evId) {
    return function() {
      $('div[data-eventid]').removeClass('highlight');
    };
  })(evId));
};