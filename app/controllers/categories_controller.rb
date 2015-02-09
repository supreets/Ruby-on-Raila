class CategoriesController < ApplicationController
    helper_method :sort_param, :sort_direction
    
    def index
        @items = Item.order('created_at DESC').limit(12)
    end
    
    def show
        @cat_id = params[:id]
       # @cat_name = Category.find_by_name(category_id: @cat_id)
        @items = Item.where(category_id: @cat_id).paginate(:per_page => 30,page: params[:page])
    end
    
    private
    def sort_param
        (["title","price"].include?(params[:sort]))? params[:sort] : "price"
    end
    
    def sort_direction
       direction =  (%w[asc desc].include?(params[:dir]))? params[:dir] : "asc"
    end
end
