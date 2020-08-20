require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |grocery_item|
    found_coupon = find_coupon(grocery_item[:item], coupons)
    if found_coupon
      if grocery_item[:count] >= found_coupon[:count]
        grocery_item[:count] = grocery_item[:count] - found_coupon[:count]
<<<<<<< HEAD
=======
        end
>>>>>>> cf1340be901e9fe5388b166da2f5cb4f8f669ff0
        found_coupon[:clearance] = grocery_item[:clearance]
        cart << found_coupon
      end
    end
  end
<<<<<<< HEAD
=======
  pp cart
>>>>>>> cf1340be901e9fe5388b166da2f5cb4f8f669ff0
end

#return hash of coupon
def find_coupon(item_name, coupons_list)
  coupons_list.each do |coupon|
    if coupon[:item] === item_name
      return {
        item: "#{coupon[:item]} W/COUPON",
        price: coupon[:cost]/coupon[:num],
        clearance: nil,
        count: coupon[:num]
      }
    end
  end
  nil
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |grocery_item|
    if grocery_item[:clearance] === true 
      grocery_item[:price] *= 0.80
      grocery_item[:price].round(2)
    end
  end
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
  new_cart = consolidate_cart(cart)
  apply_coupons(new_cart, coupons)
  apply_clearance(new_cart)
  total = 0
  new_cart.each { |grocery_item| total += grocery_item[:count] * grocery_item[:price] }
  if total > 100
    total *= 0.90
  end
  total.round(2)
end
