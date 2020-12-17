Rails.application.routes.draw do


get("/users", { :controller => "application", :action => "index"})
get("/users/new", { :controller => "application", :action => "new"})
get("/users/create", { :controller => "application", :action => "create"})
get("/users/edit/:id", { :controller => "application", :action => "edit"})
get("/users/:id", { :controller => "application", :action => "show"})
get("/users/finalize/:id", { :controller => "application", :action => "finalize"})
get("/users/destroy/:id", { :controller => "application", :action => "destroy"})
root 'application#index'
get("/microposts", { :controller => "microposts", :action => "index"})
get("/microposts/new", { :controller => "microposts", :action => "new"})
get("/microposts/create", { :controller => "microposts", :action => "create"})
get("/microposts/edit/:id", { :controller => "microposts", :action => "edit"})
get("/microposts/:id", { :controller => "microposts", :action => "show"})
get("/microposts/finalize/:id", { :controller => "microposts", :action => "finalize"})
get("/microposts/destroy/:id", { :controller => "microposts", :action => "destroy"})


end
