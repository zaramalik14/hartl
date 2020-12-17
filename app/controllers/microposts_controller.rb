class MicropostsController < ApplicationController

  def index
    @posts = Micropost.all
    render({ :template => "microposts/index.html.erb"})
  end

  def new
  
    render({ :template => "microposts/new.html.erb"})
  end

  def create
    #Parameters: {"query_content"=>"hello", "query_user"=>"1"}
    the_content = params.fetch("query_content")
    the_user_id = params.fetch("query_user")

    new_post = Micropost.new
    new_post.content = the_content
    new_post.user_id = the_user_id
    new_post.save

    redirect_to("/microposts")
  end

  def edit
    #Parameters: {"id"=>"5"}
    micropost_id = params.fetch("id")
    @micropost = Micropost.where({ :id => micropost_id}).at(0)
    render({ :template => "microposts/edit.html.erb"})

  end

  def show
    #Parameters: {"id"=>"5"}
    micropost_id = params.fetch("id")
    @micropost = Micropost.where({ :id => micropost_id}).at(0)
    render({ :template => "microposts/show.html.erb"})
  end

  def finalize
  #Parameters: {"edit_content"=>"hello world!", "edit_user"=>"1", "id"=>"5"}
  micropost_id = params.fetch("id")
  micropost_content = params.fetch("edit_content")
  micropost_user = params.fetch("edit_user")
  micropost = Micropost.where({ :id => micropost_id}).at(0)

  micropost.content = micropost_content
  micropost.user_id = micropost_user
  micropost.save

  redirect_to("/microposts")
  end

  def destroy
    #Parameters: {"id"=>"5"}
    micropost_id = params.fetch("id")
    micropost = Micropost.where({ :id => micropost_id}).at(0)
    micropost.destroy

    redirect_to("/microposts")
  end
end
