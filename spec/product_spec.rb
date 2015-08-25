require('spec_helper')

describe(Product) do
  describe('#purchase') do
    it("tells which purchase it belongs to") do
      test_purchase = Purchase.create({:date => '"2015-10-01"'})
      test_product = Product.create({:description => 'ridiculous shelf', :purchase_id => test_purchase.id()})
      expect(test_product.purchase()).to(eq(test_purchase))
    end
  end

end
