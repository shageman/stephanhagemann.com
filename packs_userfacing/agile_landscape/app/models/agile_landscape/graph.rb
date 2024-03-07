# typed: false
class AgileLandscape::Graph
  def initialize(focus_type = nil, focus_id = nil)
    @focus_type = focus_type
    @focus_id = focus_id
  end

  def calculate
    result = "graph {\n"

    sections(entries).each do |section|
      result += <<~DOC
        subgraph cluster_#{section} {
          color = blue
          label = "#{section}"
          fontsize = 60

      DOC

      entries.each do |e|
        if e.section == section
          result += "  \"#{e.name}\" [URL=\"#{Rails.application.routes.url_helpers.agile_landscape_entry_path(version: e.version.to_param, id: e.to_param)}\"]\n"
        end
      end

      result += <<~DOC
        }

      DOC
    end

    entry_connections.each do |ec|
      if ec.entry_id < ec.connected_entry_id
        result += "  \"#{ec.entry.name}\" -- \"#{ec.connected_entry.name}\" [color = \"#{ec.framework.color}\"]\n"
      end
    end

    result += "}"

    result
  end

  def sections(entries)
    if !@focus_type
      AgileLandscape::Entry.all.pluck(:section).uniq
    elsif @focus_type == :entry
      AgileLandscape::Entry.where(id: entries.map(&:id)).pluck(:section).uniq
    elsif @focus_type == :framework
      entriy_ids = AgileLandscape::FrameworkConnection.where(framework_id: @focus_id).pluck(:entry_id)
      AgileLandscape::Entry.where(id: entriy_ids).pluck(:section).uniq
    end
  end

  def entries
    if !@focus_type
      AgileLandscape::Entry.all
    elsif @focus_type == :entry
      entities1 = AgileLandscape::EntryConnection.where(entry_id: @focus_id)
      entities2 = AgileLandscape::EntryConnection.where(connected_entry_id: @focus_id)

      entity_ids = entities1.inject([]) { |res, e| res += [e.entry_id, e.connected_entry_id]}
      entity_ids = entities2.inject(entity_ids) { |res, e| res += [e.entry_id, e.connected_entry_id]}
      entity_ids = entity_ids.uniq

      AgileLandscape::Entry.where(id: entity_ids)
    elsif @focus_type == :framework
      entitiy_ids = AgileLandscape::FrameworkConnection.where(framework_id: @focus_id).pluck(:entry_id)
      AgileLandscape::Entry.where(id: entitiy_ids)
    end
  end

  def entry_connections
    if !@focus_type
      AgileLandscape::EntryConnection.all
    elsif @focus_type == :entry
      AgileLandscape::EntryConnection.where(entry_id: @focus_id).to_a +
        AgileLandscape::EntryConnection.where(connected_entry_id: @focus_id).to_a
    elsif @focus_type == :framework
      AgileLandscape::EntryConnection.where(framework_id: @focus_id)
    end
  end
end
