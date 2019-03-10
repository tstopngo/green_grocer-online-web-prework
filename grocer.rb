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
    if cart[cart_item][:clearance] 
      price = cart[cart_item][:price] 
      price = price - (price*0.2)
      cart[cart_item][:price] = price
    end
  end
end

def checkout(cart, coupons)
  # code here
  new_cart= consolidate_cart(cart)
  new_cart = apply_coupons(new_cart, coupons)
  new_cart= apply_clearance(new_cart)
  cart_total = 0

  new_cart.each do |cart_item, item_hash|
      cart_total += (new_cart[cart_item][:price] * new_cart[cart_item][:count])
  end

  if cart_total > 100
    cart_total -= cart_total*0.1
  end

  cart_total    

end
