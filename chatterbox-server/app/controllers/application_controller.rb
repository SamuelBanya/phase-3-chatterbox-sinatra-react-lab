class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"
  # GET /messages: returns an array of all messages as JSON, ordered by created_at in ascending order.
  get "/messages" do 
    # First attempt:
    # messages = Message.all.order(created_at: :asc)
    messages = Message.all.order(:created_at)
    messages.to_json()
  end

  # POST /messages: creates a new message with a body and username from params, and returns the newly created post as JSON.
  post "/messages" do
    messages = Message.create(
      body: params[:body],
      username: params[:username]
    )
    messages.to_json()
  end
  
  # PATCH /messages/:id: updates the body of the message using params, and returns the updated message as JSON.
  patch "/messages/:id" do 
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json()
  end

  # DELETE /messages/:id: deletes the message from the database.
  delete "/messages/:id" do 
    message = Message.find(params[:id])
    message.destroy()
    message.to_json()
  end
end
