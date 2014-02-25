module ApplicationHelper
  include Twitter::Autolink

  def friendly_time(activity)
    activity.timestamp.strftime('%-I:%M%P')
  end

  def friendly_date(activity)
    activity.timestamp.strftime('%A, %-e %B %Y')
  end

  def url_date(activity)
    activity.timestamp.strftime('%Y-%m-%d')
  end

end
