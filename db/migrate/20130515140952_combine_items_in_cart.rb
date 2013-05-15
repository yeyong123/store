class CombineItemsInCart < ActiveRecord::Migration
 
  def up
    Cart.all.each do |cart| #迭代每个购物车开始
      #对相关联的产品product_id 进行编组，并计算总和。
      sums = cart.line_items.group(:product_id).sum(:quantity) 
      #迭代每一计算之和，从每一迭代中提取产品（product）和数目（quantity）
      sums.each do |product_id, quantity|
        if quantity > 1 
          #对于数量大于 1 的 数目，进行全部删除相关联的单个产品。
          cart.line_items.where(product_id: product_id).delete_all
          #用正确的数量单行商品代替所删除的。
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save
        end
      end
    end
  end

  def self.down
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do
        LineItem.create cart_id: line_item.cart_id, 
                        product_id: line_item.product_id,quantity: 1
      end
      line_item.destroy
    end
  end
end
