require 'grape'

Blog::Application.routes.draw do
  
  mount Wadja::API => "/"

end
