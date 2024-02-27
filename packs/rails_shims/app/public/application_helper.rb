# typed: false
module ApplicationHelper
  #format a datetime string into a human readable date
  def format_date(date_time_string)
    d = DateTime.parse(date_time_string)
    .strftime("%B %d, %Y")
  end

  #format a datetime string into a human readable date and time
  def format_date_time(date_time_string)
    d = DateTime.parse(date_time_string)
    d.strftime("%B %d, %Y at %I:%M")
  end
end
