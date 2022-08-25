class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # sql_query = <<~SQL
      #   movies.title @@ :query
      #   OR movies.synopsis @@ :query
      #   OR directors.first_name @@ :query
      #   OR directors.last_name @@ :query
      # SQL
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
      @movies = Movie.search_by_title_and_synopsis(params[:query])
    else
      @movies = Movie.all
    end
  end
end
