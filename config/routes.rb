Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show_details" })
  get("/add_user", { :controller => "users", :action => "add_user" })
  get("/update_user/:updated_user_id", { :controller => "users", :action => "update_user" })
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "show_details" })
  get("/delete_photo/:delete_id", { :controller => "photos", :action => "delete_photo" })
  get("/add_photo", { :controller => "photos", :action => "add_photo" })
  get("/update_photo/:update_id", { :controller => "photos", :action => "update_photo" })
  get("/add_comment", { :controller => "photos", :action => "add_comment" })
end
