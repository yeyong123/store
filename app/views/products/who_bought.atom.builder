#encoding:utf-8
atom_feed do |feed|
  feed.title "订购 #{product.title}"
  
  latest_order = @product.orders.sort_by(&:updated_at).last
  feed.updated( latest_order && latest_order.updated_at)

  @product.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "订单#{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "送货地址是 #{order.address}"

        xhtml.table do
          xhtml.tr do
            xhtml.th '产品'
            xhtml.th '数量'
            xhtml.th '合计价格'
          end
        
     order.line_items.each do |item|
       xhtml.tr do
         xhtml.td item.product.title
         xhtml.td item.quantity
         xhtml.td item.total_price
        end
      end

     xhtml.tr do
       xhtml.th '合计', colspan: 2
       xhtml.th order.line_items.map(&:total_price).sum
      end
    end

        xhtml.p "从#{order.pay_type}支付"
      end

      entry.author do |author|
        entry.name order.name
        entry.email order.email
      end
    end
  end
end
