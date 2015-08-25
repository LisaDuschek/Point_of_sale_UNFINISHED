require('sinatra')
require('sinatra/reloader')
require ('sinatra/activerecord')
require('./lib/purchase')
require('./lib/product')
also_reload('lib/**/*.rb')
require('pg')

get("/") do
	erb(:index)
end

get('/purchases') do
  @purchases = Purchase.all()
  erb(:purchases)
end

post('/purchases') do
	@purchases = Purchase.all()
	erb(:purchases)
  date = params.fetch('date')
  @purchase = Purchase.new({:date =>date})
  if @purchase.save()
  erb(:purchases)
  else
  erb(:errors_purchase)
end
end

get('/products') do
  @products = Product.all()
  erb(:products)
end

post('/products/new') do
	@products = Product.all()
  description = params.fetch('description')
  price = params.fetch('price')
  @product = Product.new({:description => description, :price=> price})
  if @product.save()
  erb(:products)
  else
	erb(:errors)
end
end

get('/products/:id') do
  @products = Product.all()
  @product = Product.find(params.fetch("id").to_i)
   erb(:product)
end

patch("/products/:id") do
  description = params.fetch("description")
	price = params.fetch("price").to_i()
  @product = Product.find(params.fetch('id').to_i())
  @product.update({:description => description, :price => price})
  @products = Product.all()
  @product = Product.find(params.fetch('id').to_i())
  erb(:product)
end

delete('/products/:id') do
  @product = Product.find(params.fetch('id').to_i())
  @product.delete()
  @products = Product.all()
  erb(:products)
end

get('/purchases/:id') do
	@purchases = Purchase.all()
	@purchase = Purchase.find(params.fetch("id").to_i)
	erb(:purchase)
end

patch("/purchases/:id") do
	date = params.fetch("date")
	@purchase = Purchase.find(params.fetch('id').to_i())
	@purchase.update({:date => date})
	@purchases = Purchase.all()
	@purchase = Purchase.find(params.fetch('id').to_i())
	erb(:purchase)
end

delete('/purchases/:id') do
	@purchase = Purchase.find(params.fetch('id').to_i())
	@purchase.delete()
	@purchases = Purchase.all()
	erb(:purchases)
end

post('/products') do
	@products = Product.all()
	@product = Product.new({:description => description, :price=> price, :id => nil})
	description = params.fetch("description")
	price = params.fetch("price").to_i()
	id = params.fetch("id").to_i()
	erb(:purchase)
end
