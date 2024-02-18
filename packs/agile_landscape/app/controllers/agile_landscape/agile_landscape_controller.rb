class AgileLandscape::AgileLandscapeController < ApplicationController
  def index
    @frameworks = AgileLandscape::Framework.all.sort_by &:name
    @entries = AgileLandscape::Entry.all.sort_by &:name
    @graph = File.read(File.expand_path(File.join(__FILE__,"../../../models/agile_landscape/data/graph.dot")))

    render layout: "page"
  end

  def show_entry
    @version = AgileLandscape::Version.find_by_slug(params[:version])
    @entry = AgileLandscape::Entry.find { _1.slug == params[:id] && _1.version_id == @version.id }
    @frameworks = @entry.framework_connections.map { _1.framework }.sort_by{ _1.name.downcase}
    @explanations = @entry.framework_connections.map(&:explanation).compact

    render layout: "page"
  end

  def show_framework
    @version = AgileLandscape::Version.find_by_slug(params[:version])
    @framework = AgileLandscape::Framework.find { _1.slug == params[:id] && _1.version_id == @version.id }
    @entries = @framework.framework_connections.map { _1.entry }.sort_by{ _1.name.downcase}

    render layout: "page"
  end
end
