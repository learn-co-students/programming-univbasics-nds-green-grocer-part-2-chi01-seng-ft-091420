require_relative './part_1_solution.rb'

require 'pry'

def apply_coupons(cart, coupons)
  counter = 0 
  while counter < coupons.length do
    groc_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    coup_name = "#{coupons[counter][:item]} W/COUPON"
    coup_item = find_item_by_name_in_collection(coup_name, cart)
    if groc_item && groc_item[:count] >= coupons[counter][:num]
      if coup_item
        coup_item[:count] += coupons[counter][:num]
        groc_item[:count] -= coupons[counter][:num]
      else 
        coup_item = {
          :item => coup_name,
          :price => coupons[counter][:cost] / coupons[counter][:num],
          :clearance => groc_item[:clearance],
          :count => coupons[counter][:num]
        }
        cart << coup_item
        groc_item[:count] -= coupons[counter][:num]
      end
    end
    counter += 1
  end
  cart
end

def apply_clearance(cart)
  counter = 0 
  while counter < cart.length do
    if cart[counter][:clearance] == true 
      cart[counter][:price] = (cart[counter][:price] * 0.8).round(2)
    end
    counter += 1
  end
  cart
end

def checkout(cart, coupons)
  con_cart = consolidate_cart(cart)
  coup_cart = apply_coupons(con_cart, coupons)
  clear_cart = apply_clearance(coup_cart)
  price_total = 0
  counter = 0
  while counter < clear_cart.length do
    price_total += clear_cart[counter][:count] * clear_cart[counter][:price]
    counter += 1
  end
  if price_total > 100
    price_total = price_total * 0.9
  end
  price_total
end
