module ApplicationHelper
    def sortable(column, title = nil)
        direction = (column == sort_param && sort_direction == "asc")? "desc" : "asc"
        link_to column.titleize, params.merge(:sort => column, :dir =>direction, :page => nil)
    end
    
    def catergory_list
        @categories = Category.all
    end
end
