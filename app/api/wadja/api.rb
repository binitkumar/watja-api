require 'grape'

module Wadja

  class API < Grape::API
    format :json  
    resource :users do
    
      post '/create' do
        response_hash = Hash.new
        response_hash['meta']= Hash.new
        user = User.new(params[:user])
		if user.valid?
		  response_code = '000'
		  response_hash['data']['userid']= user.id
		else
		  response_code = '000'
		  response_hash['data']= nil
		end
		
      end
      
      
      get do
        respnose['data'] = User.all
		response['meta'] = Hash.new
        response['meta']['response_code'] = '000'		
      end
      
      get ':id' do
        User.find(params[:id])
      end
	end
  end

end

