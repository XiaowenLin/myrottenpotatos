class MoviesController < ApplicationController
  def index
    @movies = Movie.find(:all, :order => :title)
# @movies = Movie.all
#@movies = @movies.sort_by do |movie|
#      if movie
#       movie.title
#     end
#   end
  end
  def show
    id = params[:id]
    begin
      @movie = Movie.find(id)
    rescue ActiveRecord::RecordNotFound
      flash[:warning] = "Movie with id #{id} doesn't exist."
      redirect_to movies_path
    end
  end
  def new
    @movie = Movie.new
  end
	def create
		@movie = Movie.new(params[:movie])
		if @movie.save
		  flash[:notice] = "#{@movie.title} was successfully created."
		  redirect_to movies_path
		else
		  render 'new' # note, 'new' template can access @movie's field values!
		end
	end
	def edit
		@movie = Movie.find params[:id]
	end
	 
	def update
		@movie = Movie.find params[:id]
		if @movie.update_attributes(params[:movie])
			flash[:notice] = "#{@movie.title} was successfully updated."
			redirect_to movie_path(@movie)
		else
			flash[:warning] = "#{@movie.errors.full_messages}"
			render 'edit'
		end
	end
  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  def movies_with_filters
    @movies = Movie.with_good_reviews(params[:threshold])
    @movies = @movies.for_kids          if params[:for_kids]
    @movies = @movies.with_many_fans    if params[:with_many_fans]
    @movies = @movies.recently_reviewed if params[:recently_reviewed]
  end
end
