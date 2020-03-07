Rails.application.routes.draw do

 get("/", { :controller => "places", :action => "index" })

  # Routes for the Place resource:

  # CREATE
  post("/insert_place", { :controller => "places", :action => "create" })
          
  # READ
  get("/places", { :controller => "places", :action => "index" })
  
  get("/places/:path_id", { :controller => "places", :action => "show" })
  
  # UPDATE
  
  post("/modify_place/:path_id", { :controller => "places", :action => "update" })
  
  # DELETE
  get("/delete_place/:path_id", { :controller => "places", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
