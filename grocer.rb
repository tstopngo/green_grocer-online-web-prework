def consolidate_cart(cart)
  # code here
  consolidate = {}
  cart.each do |list|
    list.each do |item, data|
      if consolidate.has_key?(item)
          consolidate[item][:count] += 1
      else
          consolidate[item] = data
          consolidate[item][:count] = 1
      end
    end
  end
  consolidate
end


def apply_coupons(cart, coupons)
  # code here
  coupon_hash = {}
  cart.each do |cart_item, item_hash|
      coupons.each do |coupon|
        if coupon[:item] == cart_item
          coupon_hash["#{cart_item} W/COUPON"] ||= {}
          coupon_hash["#{cart_item} W/COUPON"][:price] ||= coupon[:cost]
          coupon_hash["#{cart_item} W/COUPON"][:clearance] ||= cart[cart_item][:clearance]
          coupon_hash["#{cart_item} W/COUPON"][:count] ||= 0
          coupon_hash["#{cart_item} W/COUPON"][:count] += 1
          cart[cart_item][:count] -= coupon[:num]
        end 
      end
    end
  cart.merge(coupon_hash)
end


def apply_clearance(cart)
  # code here
  cart.each do |cart_item, item_hash|
    if cart_item[:clearance] == true
      cart_item[:price] 
    
end

def checkout(cart, coupons)
  # code here
  
end
