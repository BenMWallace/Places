class PlacesController < ApplicationController
  def index
    @places = @current_user.places.all.order({ :Datetime_start => :asc })
    @unique_datetimes = @current_user.places.all.pluck(:datetime_start).uniq #.order({ :Datetime_start => :asc })

    render({ :template => "places/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @place = Place.where({:id => the_id }).at(0)

    render({ :template => "places/show.html.erb" })
  end

  def create
    @place = Place.new
    @place.owner_id = @current_user.id
    @place.name = params.fetch("query_name")
    @place.description = params.fetch("query_description")
    @place.datetime_start = params.fetch("query_datetime_start")
    @place.datetime_end = params.fetch("query_datetime_end")
    @place.address = params.fetch("query_address")

    if @place.valid?
      @place.save
      redirect_to("/places", { :notice => "Place created successfully." })
    else
      redirect_to("/places", { :notice => "Place failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @place = Place.where({ :id => the_id }).at(0)

    #@place.owner_id = params.fetch("query_owner_id")
    @place.name = params.fetch("query_name")
    @place.description = params.fetch("query_description")
    @place.datetime_start = params.fetch("query_datetime_start")
    @place.datetime_end = params.fetch("query_datetime_end")
    @place.address = params.fetch("query_address")

    if @place.valid?
      @place.save
      redirect_to("/places/#{@place.id}", { :notice => "Place updated successfully."} )
    else
      redirect_to("/places/#{@place.id}", { :alert => "Place failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @place = Place.where({ :id => the_id }).at(0)

    @place.destroy

    redirect_to("/places", { :notice => "Place deleted successfully."} )
  end
end
