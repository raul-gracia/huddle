class SavedSearchesController < ApplicationController
  before_action :set_saved_search

  # GET /saved_searches
  def index
  end

  # GET /saved_searches/new
  def new
    @saved_search = SavedSearch.new
  end

  # GET /saved_searches/1/edit
  def edit
    render :index
  end

  # POST /saved_searches
  def create
    @saved_search = current_user.saved_searches.new(saved_search_params)

    respond_to do |format|
      if @saved_search.save
        @saved_search.topic_ids = params[:saved_search]['topics']
        @saved_search.save!
        format.html { redirect_to saved_searches_path, notice: 'Saved search was successfully created.' }
      else
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /saved_searches/1
  def update
    respond_to do |format|
      if @saved_search.update(saved_search_params)
        @saved_search.topic_ids = params[:saved_search]['topics']
        @saved_search.save!
        format.html { redirect_to saved_searches_path, notice: 'Saved search was successfully updated.' }
      else
        format.html { render :index }
      end
    end
  end

  # DELETE /saved_searches/1
  def destroy
    @saved_search.destroy
    respond_to do |format|
      format.html { redirect_to saved_searches_path, notice: 'Saved search was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_search
      @saved_searches = current_user.saved_searches
      begin
        @saved_search = current_user.saved_searches.find(params[:id])
      rescue
        @saved_search = SavedSearch.new
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saved_search_params
      params.require(:saved_search).permit(:name, :start_time, :end_time, :city)
    end
end
