# typed: strict
module ApplicationHelper
  extend T::Sig

  #format a datetime string into a human readable date
  sig { params(date_time_string: String).returns(String) }
  def format_date(date_time_string)
    d = DateTime.parse(date_time_string)
    d.strftime("%B %d, %Y")
  end

  #format a datetime string into a human readable date and time
  sig { params(date_time_string: String).returns(String) }
  def format_date_time(date_time_string)
    d = DateTime.parse(date_time_string)
    d.strftime("%B %d, %Y at %I:%M")
  end
end
