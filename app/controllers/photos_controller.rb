class PhotosController < ApplicationController
  def index
    @all_photos = Photo.all.order({ :created_at => :desc })
    render({ :template => "photo_templates/index.html.erb" })
  end

  def show_details
    photo_id = params.fetch(:photo_id)
    @this_photo = Photo.where(:id => photo_id).first
    render({ :template => "photo_templates/show_details.html.erb" })
  end
end
