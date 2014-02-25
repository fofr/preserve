class MapController < ApplicationController
  def index
    @locations = Location.all
    @checkins = Foursquare.all
  end
end
