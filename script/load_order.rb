Order.transaction do
  (1..100).each do |i|
    Order.create(name: "客户#{i}",address: "#{i}主要街道",
                 email: "customer-#{i}@example.com", pay_type: "支付宝")
  end
end
