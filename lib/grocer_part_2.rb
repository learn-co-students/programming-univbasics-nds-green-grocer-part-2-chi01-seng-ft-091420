require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
 i = 0
   while i < cart.length do
     coupon = nil
     x = 0
     while x < coupons.length do
       if cart[i][:item] == coupons[x][:item]
         coupon = coupons[x]
       end
       x += 1
     end
     if coupon != nil
       item_coupon = cart[i].clone
       item_coupon[:item] += " W/COUPON"
       num_coupons = (cart[i][:count] / coupon[:num]).floor
       num_coupons
       if (num_coupons > 0)
         num_for_item = cart[i][:count] - num_coupons * coupon[:num]
         cart[i][:count] = num_for_item
         item_coupon[:count] = num_coupons * coupon[:num]
         item_coupon[:price] = coupon[:cost] / coupon[:num]
         cart << item_coupon
       end
     end
     i += 1
   end
   cart
end


def apply_clearance(cart)
i = 0
  while i < cart.length do
    if (cart[i][:clearance])
      cart[i][:price] *= 0.8
      cart[i][:price] = (cart[i][:price] * 100.0).round / 100.0
    end
    i += 1
  end
  cart
end

def checkout(cart, coupons)
  # This method should call
  #
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have some irritated customers
 
   i = 0
  total = 0.0
  
  cart1 = consolidate_cart(cart)
  cart2 = apply_coupons(cart1, coupons)
  cart3 = apply_clearance(cart2)
#binding.pry
    while i < cart3.length do
      total += cart3[i-1][:price] * cart3[i-1][:count]
      i += 1
     #binding.pry
    end
    p total
    if total >= 100
      total = total * 0.9
    end
    p total
end
