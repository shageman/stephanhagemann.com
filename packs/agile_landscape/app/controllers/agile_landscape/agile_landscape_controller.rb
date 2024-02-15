class AgileLandscape::AgileLandscapeController < ApplicationController
  def index
    @frameworks = AgileLandscape::Framework.all.sort_by &:Framework
    @entries = AgileLandscape::Entry.all.sort_by &:Name
    @graph = File.read(File.expand_path(File.join(__FILE__,"../../../models/agile_landscape/data/graph.dot")))

    render layout: "page"
  end

  def show_entry
    @entry = AgileLandscape::Entry.find_by_slug("/agile_landscape/version/#{params[:version]}/entries/#{params[:id]}")
    
    render layout: "page"
  end

  def show_framework
    @framework = AgileLandscape::Framework.find_by_slug("/agile_landscape/version/#{params[:version]}/frameworks/#{params[:id]}")

    render layout: "page"
  end
end
