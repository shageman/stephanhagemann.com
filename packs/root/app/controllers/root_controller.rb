class RootController < ApplicationController
  def index
    @containerClass = "centered-container"
    @activeSection = 'root'
  end
end