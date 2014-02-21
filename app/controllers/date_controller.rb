class DateController < ApplicationController

  def index

    start_date = Date.parse('2005-01-01')
    end_date = Time.now

    @dates = (start_date..end_date).map { |date| date }.reverse

  end

  def show
    @date = Date.parse(params[:id])
    range = @date..@date+1

    @scrobbles  = Scrobble.where(timestamp: range)
    @checkins   = Foursquare.where(timestamp: range)
    @tweets     = Tweet.where(timestamp: range)
    @journals   = Journal.where(timestamp: range)

  end

end
