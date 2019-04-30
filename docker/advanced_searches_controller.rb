class AdvancedSearchesController < ApplicationController
    skip_before_filter :project_membership_required
    def new
        @advanced_search = AdvancedSearch.new
    end

    def show
        @advanced_search = AdvancedSearch.find(params[:id])
    end
    
    def create
	search_params
	d = params[:advanced_search]
	redirect_to controller: 'search', action: 'index', q: d[:keywords], search_type: d[:search_type], advanced_search: true, min_due_date: d[:min_due_date], max_due_date: d[:max_due_date], institution: [:institution], discipline: [:discipline], city: d[:city], expertise: d[:expertise], project_status: d[:status]
        #@advanced_search = AdvancedSearch.create(search_params)
        #redirect_to @advanced_search
    end

    private

    def search_params 
        params.require(:advanced_search).permit(:keywords, :search_type, :status, :min_due_date, :max_due_date, :institution, :discipline, :city, :expertise) #:scale, :include_external_search)
	d = params[:advanced_search]
        @search_query = d[:keywords]
	@search_type = d[:search_type]
    end
end
