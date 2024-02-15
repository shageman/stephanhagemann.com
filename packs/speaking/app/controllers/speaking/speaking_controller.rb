class Speaking::SpeakingController < ApplicationController
  def index
    @upcoming_talks = Speaking::Talk.all.select { Date.parse(_1.date) > Time.current }.sort_by { Date.parse(_1.date) }
    @past_talks = Speaking::Talk.all.select { Date.parse(_1.date) <= Time.current }.sort_by { Date.parse(_1.date) }.reverse

    render layout: "page"
  end
end
