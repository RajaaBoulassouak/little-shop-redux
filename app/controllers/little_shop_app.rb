class LittleShopApp < Sinatra::Base
  get '/merchants' do
    @current_page = (params[:page] ||= 1).to_i
    @last_page = Merchant.max_page
    @current_page > 1 ? @prior_page = (@current_page - 1) : @prior_page = @current_page
    @next_page = @current_page + 1
    @merchants = Merchant.paginate(@current_page)
    erb :'merchants/index'
  end

  get '/merchants-dashboard' do
    @merchants = Merchant.all
    @merchants_slices = Merchant.all.each_slice(4)
    @highest_price_item = Merchant.highest_price_item
    @merchant_with_most_items = Merchant.merchant_with_most_items
    erb :'merchants/dashboard'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/edit'
  end

  put '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{id}"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find( params[:id])
    @items = @merchant.items.each_slice(4)
    erb :'merchants/show'
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect '/merchants'
  end

  get '/items' do
    @merchants = Merchant.all.order(:name)
    @current_page = (params[:page] ||= 1).to_i
    @last_page = Item.maxpage
    @current_page > 1 ? @prior_page = (@current_page - 1) : @prior_page = @current_page
    @next_page = @current_page + 1
    @items = Item.shard(@current_page)
    erb :'items/index'
  end

  get '/items/new' do
    @merchants = Merchant.all
    erb :'items/new'
  end

  post '/items' do
    create_details = params[:item]
    merchant_id = Merchant.find_by(name: create_details[:merchant].strip)
    Item.create(name: create_details[:name],
                description: create_details[:description],
                unit_price: create_details[:unit_price].to_i,
                merchant_id: merchant_id.id,
                image: create_details[:image])
    redirect "/items"
  end

  get '/items-dashboard' do
    @items = Item.all
    erb :'items/dashboard'
  end

  put '/items/:id' do |id|
    update_details = params[:item]
    merchant_id = Merchant.find_by(name: update_details[:merchant].strip)
    Item.update(id.to_i,
                name: update_details[:name],
                description: update_details[:description],
                unit_price: update_details[:unit_price].to_i,
                merchant_id: merchant_id.id,
                image: update_details[:image])
    redirect "/items/#{id}"
  end

  delete '/items/:id' do |id|
    Item.destroy(id.to_i)
    redirect '/items'
  end

  get '/items/:id/edit' do
    @merchants = Merchant.all
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  get '/items/:id' do |id|
    @merchants = Merchant.all
    @item = Item.find(id)
    erb :'items/show'
  end

  get '/invoices' do
    @statuses = Invoice.statuses
    @current_page = (params[:page] ||= 1).to_i
    @last_page = Invoice.maxpage
    @current_page > 1 ? @prior_page = (@current_page - 1) : @prior_page = @current_page
    @next_page = @current_page + 1
    @invoices = Invoice.paginate(@current_page)
    erb :'invoices/index'
  end

  get '/invoices_dashboard' do
    @percent_by_status = Invoice.percent_by_status
    @max_by_unit_price = Invoice.max_by_unit_price
    @min_by_unit_price = Invoice.min_by_unit_price
    @max_by_quantity = InvoiceItem.max_by_quantity
    @min_by_quantity = InvoiceItem.min_by_quantity
    erb :'invoices/dashboard'
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])
    @invoice_items = @invoice.invoice_items
    @statuses = Invoice.statuses
    erb :'invoices/edit'
  end

  put '/invoices/:id' do |id|
    Invoice.update(id.to_i, params[:invoice])
    redirect "/invoices/#{id}"
  end

  get '/invoices/:id' do |id|
    @statuses = Invoice.statuses
    @invoice = Invoice.find(id)
    @invoice_items = @invoice.invoice_items
    erb :'invoices/show'
  end

  delete '/invoices/:id' do |id|
    Invoice.destroy(id.to_i)
    redirect '/invoices'
  end

end
