require('spec_helper')

describe (Purchase) do

  describe('#products') do
    it("tells which products belong to a purchase") do
      test_purchase=Purchase.create({:date => "2015-10-01"})
      test_product=Product.create({:description => "stupid chair", :price => 20, :purchase_id => test_purchase.id()})
      test_product2=Product.create({:description => "silly lamp", :price => 100, :purchase_id => test_purchase.id()})
      expect(test_purchase.products()).to(eq([test_product, test_product2]))
    end
  end




end
