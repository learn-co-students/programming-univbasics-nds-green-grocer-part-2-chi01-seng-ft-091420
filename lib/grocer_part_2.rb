require_relative './part_1_solution.rb'
require 'pry'



def apply_coupons(cart, coupons)
  counter = 0
  while counter < coupons.length
    #binding.pry
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    couponed_item_name = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[counter][:num]
        cart_item[:count] -= coupons[counter][:num]
      else
        cart_item_with_coupon = {item: couponed_item_name, 
        price: coupons[counter][:cost]/coupons[counter][:num],
        count: coupons[counter][:num], 
        clearance: cart_item[:clearance]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
      end
    end
    counter += 1
  end
  cart
end
  
def apply_clearance(cart)
  new_cart = []
  cart.map do |item|
    k = item[:price]*0.8
    if item[:clearance] == true
       item[:price] = k.round(2)
    end
    
  end
  return cart
end
 

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(coupon_cart)
  total = 0
  counter = 0
  while counter < final_cart.length
    total += final_cart[counter][:price] * final_cart[counter][:count]
    counter +=1
  end
  
  if total > 100
    total -= (total * 0.10)
  end
  total
  
end


# apply_clearance([
#   {:item => "PEANUT BUTTER", :price => 3.00, :clearance => true,  :count => 2},
#   {:item => "KALE", :price => 3.00, :clearance => false, :count => 3},
#   {:item => "SOY MILK", :price => 4.50, :clearance => true,  :count => 1}
#   ])





# def aapply_coupons(cart, coupons)
#   new_cart = cart
#   coupons.each do |coupon|
#     name = coupon[:item]
#     num_of_c = coupon[:num]
#     cart.each do |food|
#       if food[:item] == name && food[:count] >= num_of_c
#         new_cart.each do |new_food|
#           new_food[:count] -= num_of_c
          
#           if new_food[:item] == ["#{name} W/COUPON"]
#             new_food[:count] += 1
#           else
#             new_cart.push({:item => "#{name} W/COUPON", :price => coupon[:cost]/num_of_c, :clearance => new_food[:clearance], :count => num_of_c})
#           end
#         end
#       end
#     end
#   end
# end

# def gapply_coupons(cart, coupons)
#   counter = 0
#   while counter < coupons.length
#     #binding.pry
#     cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
#     couponed_item_name = "#{coupons[counter][:item]} W/COUPON"
#     cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
#     if cart_item && cart_item[:count] >= coupons[counter][:num]
#       if cart_item_with_coupon
#         cart_item_with_coupon[:count] += coupons[counter][:num]
#         cart_item[:count] -= coupons[counter][:num]
#       else
#         cart_item_with_coupon = {item: couponed_item_name, 
#         price: coupons[counter][:cost]/coupons[counter][:num],
#         count: coupons[counter][:num], 
#         clearance: cart_item[:clearance]
#         }
#         cart << cart_item_with_coupon
#         cart_item[:count] -= coupons[counter][:num]
#       end
#     end
#     counter += 1
#   end
#   cart
# end
