module MusicsHelper
    def sortable(column, label = nil)
        label ||= Music.human_attribute_name(column)
        direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
        link_to label, { sort: column, direction: direction, keyword: params[:keyword] }
    end
end
