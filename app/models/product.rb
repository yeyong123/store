#encoding:utf-8
class Product < ActiveRecord::Base
  default_scope order: 'title'
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {
                    greater_than_or_equal_to: 0.01 }
  validates :image_url, format: {with: %r{\.(gif|jpg|png)$ }i,
                                 message: '链接地址必须是GIF，JPG，PNG图像'}

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, '购物车有商品')
      return false
    end
  end
end
