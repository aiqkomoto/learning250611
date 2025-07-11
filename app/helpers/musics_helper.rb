module MusicsHelper
    def sortable(column, label = nil)
        label ||= Music.human_attribute_name(column)
        direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
        link_to label, { sort: column, direction: direction, keyword: params[:keyword] }
    end
    
    def sortable_icon_button(column)
        current_sort_column = params[:sort]
        current_direction = params[:direction] == "desc" ? "desc" : "asc"

        # アイコンを決定
        if current_sort_column == column
        arrow = current_direction == "asc" ? "▲" : "▼"
        next_direction = current_direction == "asc" ? "desc" : "asc"
        else
        arrow = ""
        next_direction = "asc"
        end

        # 表示内容はアイコンのみ
        link_to arrow.presence || "↕", { sort: column, direction: next_direction, keyword: params[:keyword] }, class: "sort-icon-button"
    end
end
