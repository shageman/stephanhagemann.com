class Speaking::SpeakingController < ApplicationController
  before_action :set_section

  def index
    @upcoming_talks = Speaking::Talk.all.select { Date.parse(_1.date) > Time.current }.sort_by { Date.parse(_1.date) }
    @past_talks = Speaking::Talk.all.select { Date.parse(_1.date) <= Time.current }.sort_by { Date.parse(_1.date) }.reverse
  end

  private

  def set_section
    @active_section = 'speaking'
  end
end