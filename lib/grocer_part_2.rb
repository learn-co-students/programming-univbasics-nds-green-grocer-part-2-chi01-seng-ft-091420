require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
    coupons.each do |coupon|
      #binding.pry
      item_w_coupon = find_item_by_name_in_collection(coupon[:item], cart)
           if  !!item_w_coupon && coupon[:num] <=  item_w_coupon[:count]
             final_item = {:item => "#{item_w_coupon[:item]} W/COUPON", :price => coupon[:cost]/coupon[:num], :clearance => item_w_coupon[:clearance], :count => coupon[:num]}
             cart << final_item
             item_w_coupon[:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |food|
    if !!food[:clearance]
      food[:price] = food[:price] * 0.8
      food[:price] = food[:price].round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  total = 0.0
  food = consolidate_cart(cart)
  apply_coupons(food, coupons)
  apply_clearance(food)
  food.each do |items|
    items[:total] = items[:price] * items[:count]
      total = total + items[:total]
  #binding.pry
  end
  if total >= 100.0
    total = total * 0.9
    total = total.round(2)
  end
  total
end
