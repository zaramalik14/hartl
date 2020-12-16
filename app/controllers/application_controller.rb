class ApplicationController < ActionController::Base

  def hello
    render html: "hello, world!"
  end

  def good_bye
    render html: "goodbye!"
  end
end
