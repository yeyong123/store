#encoding:utf-8
class Order < ActiveRecord::Base
  has_many :line_item, dependent: :destroy
  attr_accessible :address, :email, :name, :pay_type
  PAYMENT_TYPES = ["支付宝","信用卡","储蓄卡"]

  validates :name, :address, :email, :pay_type, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_item << item
    end
  end
end

