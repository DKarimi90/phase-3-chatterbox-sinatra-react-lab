class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  
  get '/messages' do 
    messages = Message.all.order(created_at: :asc)
    messages.to_json 
  end


  post '/messages' do 
    post = Message.create(
      body: params[:body],
      username: params[:username]
    )
    post.to_json 
  end

  patch '/messages/:id' do 
    message_body = Message.find(params[:id])
    message_body.update(
      body: params[:body], 
      username: params[:username]
    )
    message_body.to_json
  end


  delete '/messages/:id' do 
    message = Message.find(params[:id])
    message.destroy 
  end

end
