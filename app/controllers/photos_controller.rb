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

  def delete_photo
    the_id = params.fetch(:delete_id)
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.at(0)
    the_photo.destroy
    # render({ :template => "photo_templates/delete_photo.html.erb" })
    redirect_to("/photos")
  end

  def add_photo
    # Parameters: {"query_image"=>"https://www.chicagobooth.edu/-/media/project/chicago-booth/why-booth/north-america/chicago-booth-uchicago-campus.jpg?cx=0.59&cy=0.56&cw=940&ch=749&hash=399733267B8702EE5E9A5C00DC831BDD", "query_caption"=>"Booth at Chicago", "query_owner_id"=>"117"}
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")
    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id
    a_new_photo.save()
    redirect_to("/photos/" + a_new_photo.id.to_s)
    # render({ :template => "photo_templates/newphoto.html.erb" })
  end

  def update_photo
    existing_id = params.fetch("update_id")
    matching_photo = Photo.where({ :id => existing_id })
    the_photo = matching_photo.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    the_photo.image = input_image
    the_photo.caption = input_caption
    the_photo.save()
    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def add_comment
    # Parameters: {"input_photo_id"=>"test", "input_author_id"=>"test", "input_comment"=>"test"}
    photo_id = params.fetch("input_photo_id")
    author_id = params.fetch("input_author_id")
    comment = params.fetch("Comment")

    new_comment = Comment.new
    new_comment.photo_id = photo_id
    new_comment.author_id = author_id
    new_comment.body = comment
    new_comment.save()
    redirect_to("/photos/" + photo_id)

    # render({ :template => "layouts/test.html.erb" })
  end
end
