require 'grape'

module Wadja

  class API < Grape::API
  
    resource :users do
    
      post '/create' do
        response_hash = Hash.new
        response_hash['meta'= Hash.new
        user = User.new(params[:user])
		if user.save
		  response_code = '000'
		  response_hash['data']['userid']= user.id
		else
		  response_code = '000'
		  response_hash['data']= nil
		end
		
      end
      
      
      get do
        User.all
      end
      
      get ':id' do
        User.find(params[:id])
      end
      
      get ':id/posts' do
        weblog = Weblog.find(params[:id])
        weblog.posts
      end
      
      post ':id/posts' do
        @weblog = Weblog.find(params[:id])
        @post = Post.new
        @post.title = params[:title] if params[:title]
        @post.body = params[:body] if params[:body]
        @weblog.posts << @post
        
        status 201
        @post
      end
      
      delete ':id/posts' do
        @weblog = Weblog.find(params[:id])
        @weblog.posts.clear
      end
      
      post do
        @weblog = Weblog.new
        @weblog.title = params[:title] if params[:title]
        @weblog.description = params[:description] if params[:description]
        @weblog.save 
        
        status 201
        @weblog
      end
      
      put ':id' do
        @weblog = Weblog.find(params[:id])
        @weblog.title = params[:title] if params[:title]
        @weblog.description = params[:description] if params[:description]
        @weblog.save
        
        @weblog
      end
      
      delete do
        Weblog.destroy_all()
      end
    
      delete ':id' do
        Weblog.destroy(params[:id])
      end
    
    end 
             
  end

end

