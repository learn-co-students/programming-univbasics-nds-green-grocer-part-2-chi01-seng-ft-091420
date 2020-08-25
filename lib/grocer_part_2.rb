require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |cart_item|
    coupons.each do |coupon_item|
      if cart_item[:item] == coupon_item[:item]
        if cart_item[:count] >= coupon_item[:num]
          new_price = coupon_item[:cost]/coupon_item[:num]
          new_name = "#{coupon_item[:item]} W/COUPON"
          new_clearance = cart_item[:clearance]
          new_count = cart_item[:count] - (cart_item[:count] % coupon_item[:num])
          cart_item[:count] = (cart_item[:count] % coupon_item[:num])
          cart.push({:item => new_name, :price => new_price, :clearance => new_clearance, :count => new_count})
        end
      end
    end
  end
  return cart
          
  
  
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |index|
    if index[:clearance] == true
      index[:price] = (index[:price] * 0.8).round(2)
      
    end
  end
  cart
  
  
  
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  total = 0
  cart.each do |index|
    total += index[:count] * index[:price]
  end
  if total > 100.00
    total *= 0.9
  end
  return total
  
  
  
end
