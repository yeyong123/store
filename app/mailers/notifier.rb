class Notifier < ActionMailer::Base
  default from: "yeyong14@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  #
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order

    mail to: "yeyong14@gmail.com", subject: "Pragmatic Store Order Confirm"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped
    @greeting = "Hi"

    mail to: "yeyong14@gmail.com", subject: "Pragmatic Store Order Shipped"
  end
end
