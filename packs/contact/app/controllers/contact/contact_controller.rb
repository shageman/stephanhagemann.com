class Contact::ContactController < ::ApplicationController
  before_action :set_section

  def index
    render layout: 'page'
  end

  private

  def set_section
    @active_section = 'root'
  end
end