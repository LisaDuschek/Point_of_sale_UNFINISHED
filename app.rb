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

post('/purchases/new') do
  date = params.fetch('date')
  purchase = Purchase.new({:date =>date, :id => nil})
  purchase.save()
  @purchases = Purchase.all()
  erb(:purchases)
end

get('/products') do
  @products = Product.all()
  erb(:products)
end

post('/products/new') do
  description = params.fetch('description')
  price = params.fetch('price')
  product = Product.new({:description => description, :price=> price, :id => nil})
  product.save()
  @products = Product.all()
  erb(:products)
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
  @product = Product.all()
  erb(:products)
end
