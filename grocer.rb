def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  index = 0 
  while index < collection.length do 
    if name == collection[index][:item]
      return collection[index]
    end 
    index += 1 
  end 
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  index = 0 
  new_cart = []
  while index < cart.length do 
    new_cart_item = find_item_by_name_in_collection(cart[index][:item], new_cart)
    if new_cart_item
      new_cart_item[:count] += 1
    else
      new_cart_item = {
        :item => cart[index][:item],
        :price => cart[index][:price],
        :clearance => cart[index][:clearance],
        :count => 1 
      }
      new_cart << new_cart_item
    end 
    index += 1
  end
  new_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  index = 0 
  while index < coupons.length do 
    cart_item = find_item_by_name_in_collection(coupons[index][:item], cart)
    coupon_item_name = "#{coupons[index][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(coupon_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[index][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[index][:num]
        cart_item[:count] -= coupons[index][:num]
      else
        cart_item_with_coupon = {
          :item => coupon_item_name,
          :price => coupons[index][:cost] / coupons[index][:num],
          :clearance => cart_item[:clearance],
          :count => coupons[index][:num]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[index][:num]
      end 
    end 
    index += 1 
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  index = 0 
  while index < cart.length do 
    if cart[index][:clearance]
      cart[index][:price] = (0.8 * cart[index][:price]).round(2) 
    end 
    index += 1 
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
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(couponed_cart)
  index = 0
  total = 0 
  while index < final_cart.length do 
    total += (final_cart[index][:price] * final_cart[index][:count])
    index += 1 
  end
  if total >= 100
    total = (total * 0.9).round(2)
  end
  total
end
