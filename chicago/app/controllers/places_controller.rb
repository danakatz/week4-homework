class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
  end

  def create
    Place.create title: params[:title],
                 price: (params[:price].to_f * 100).to_i,
                 photo_url: params[:url],
                 desc: params[:desc]

    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
    @reviews = Review.where(place_id: @place.id).order('id desc')
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])

    if params[:title].nil? 
      Review.create place_id: @place.id,
                    rating: params[:rating].to_i,
                    desc: params[:desc]
    else
      @place.update title: params[:title],
                    price: (params[:price].to_f * 100).to_i,
                    photo_url: params[:url],
                    desc: params[:desc]
    end
    
    redirect_to place_url(@place.id)
  end

  def destroy
    Place.delete(params[:id])
    Review.where(place_id: params[:id]).delete_all
    redirect_to root_path
  end

end
