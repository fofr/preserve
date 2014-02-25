module MapHelper

  def checkin_info_window(checkin)
    "<a href='/date/#{url_date(checkin)}'>#{friendly_date(checkin)}</a>\
     <br />\
     <strong>#{checkin.venue}</strong>"
  end

  def checkin_location(checkin)
    "{ lat: #{checkin.latitude}, lng: #{checkin.longitude}, infowindow: \"#{checkin_info_window(checkin)}\" },".html_safe
  end

end
