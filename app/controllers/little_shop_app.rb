class LittleShopApp < Sinatra::Base
  
  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find_by( id: params[:id] )
    erb :'merchants/edit'
  end

  put '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{id}"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find_by( id: params[:id] )
    erb :'merchants/show'
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect '/merchants'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    erb :'items/new'
  end

  post '/items' do
    Item.create(params[:item])
    redirect '/items'
  end

  put '/items/:id' do |id|
    Item.update(id.to_i, params[:item])
    redirect "items/#{id}"
  end

  delete '/items/:id' do |id|
    Item.destroy(id.to_i)
    redirect '/items'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  get '/items/:id' do |id|
    @item = Item.find(id)
    erb :'items/show'
  end
  
  get '/invoices' do
    @invoices = Invoice.all
    erb :'invoices/index'
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find_by( id: params[:id] )
    erb :'invoices/edit'
  end

  put '/invoices/:id' do |id|
    Invoice.update(id.to_i, params[:invoice])
    redirect "/invoices/#{id}"
  end

  get '/invoices/:id' do
    @invoice = Invoice.find_by( id: params[:id] )
    erb :'invoices/show'
  end

  delete '/invoices/:id' do |id|
    Invoice.destroy(id.to_i)
    redirect '/invoices'
  end
end
