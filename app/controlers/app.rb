class App < Sinatra::Base

  configure do
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/contacts' do
    @contacts = Contact.all
    erb :contacts
  end

  get '/contacts/new' do
    erb :new
  end

  post '/contacts' do
    Contact.create name: params[:name], phone: params[:phone]
    @contacts = Contact.all

    erb :contacts
  end

  get '/contacts/:id' do
    @contact = Contact.find params[:id]
    erb :show
  end


end
