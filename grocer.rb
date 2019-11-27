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
  index_1 = 0 
  new_cart = []
  while index_1 < cart.length do
    new_cart[index_1] = cart[index_1]
    new_cart[index_1][:count] = 1 
    index_1 += 1 
  end
  index_2 = 0
  index_3 = 0
  while index_2 < new_cart.length do 
    if new_cart[index_2][:item] == new_cart[index_3][:item]
      new_cart[index_2][:count] += 1
      new_cart.delete_at(index_3)
      index_3 += 1
    end 
    index_2 += 1 
  end
  new_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
end
