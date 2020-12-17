class ApplicationController < ActionController::Base

  
  def index
    render({ :template => "layouts/index.html.erb"})
  end

  def new
    render({ :template => "layouts/new.html.erb"})
  end

  def create
    #Parameters: {"query_name"=>"Zara", "query_email"=>"zara@example.com"}

    new_name = params.fetch("query_name")
    new_email = params.fetch("query_email")

    a_user = User.new
    a_user.name = new_name
    a_user.email = new_email
    a_user.save

      if a_user.save == true
        redirect_to("/users", :notice => "User was successfully created")
      else
        redirect_to("/users/new", :notice => "User was not successfully created")
      end
  end

  def show
    #Parameters: {"id"=>"1"}
    @user_id = params.fetch("id")
    @user = User.where({ :id => @user_id}).at(0)
    
    render({ :template => "layouts/show.html.erb"})

  end

  def edit
    #Parameters: {"id"=>"2"}
    @user_id = params.fetch("id")
    @user = User.where({ :id => @user_id}).at(0)

    render({ :template => "/layouts/edit.html.erb"})

  end

  def finalize
    #Parameters: {"edited_name"=>"Sonia Kapoor", "edited_email"=>"sonia@example.com", "id"=>"2"}
    the_id = params.fetch("id")
    the_name = params.fetch("edited_name")
    the_email = params.fetch("edited_email")
    user = User.where({ :id => the_id}).at(0)
    user.name = the_name
    user.email = the_email
    user.save

    redirect_to("/users")

  end

  def destroy
    #Parameters: {"id"=>"1"}

    the_id = params.fetch("id")
    user = User.where({ :id => the_id}).at(0)
    user.destroy

    redirect_to("/users")
  end

end
