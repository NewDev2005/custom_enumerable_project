module Enumerable

  def my_inject(initial_value) #this one is not my solution
    self.my_each do |item|
      initial_value = yield(initial_value,item)
    end
    return initial_value

  end

  def my_map
    modified_arr = []
    self.my_each do |item|
     new_elem = yield(item)
      modified_arr.push(new_elem)
    end
    return modified_arr
  end

  def my_each_with_index 
    index = 0
    self.my_each do |item|
       yield(item,index)
       index += 1
    end
  end

  def my_count
  if !block_given?
    length = 0
    self.my_each do |item|
      length += 1
    end
    return length 
  elsif block_given?
    duplicate_elem = 0
    self.my_each do |item|
      if yield(item)
        duplicate_elem += 1
      end
    end
    return duplicate_elem
  end
end

  def my_any? 
    matched_elem = 0
    self.my_each do |item|
      if yield(item)
        matched_elem += 1
      end
    end
    if matched_elem > 1
      return true
    else 
      return false
    end
  end


  def my_none?
    falsy_values = []
    self.my_each do |item|
      if yield(item) == false
        falsy_values.push(0)
        next
      else 
        break
      end
    end

    if falsy_values.length == self.length
      return true
    else 
      return false
    end
  end
  
  def my_all?
    track_truthy_value = []
    self.my_each do |item|
      if yield(item)
        track_truthy_value.push(1)
        next
      else
        break
      end
    end
    if track_truthy_value.length == self.length
        return true
    else  
        return false
      end
  end

  def my_select
    selected_elem = []
    self.my_each do |item|
      if yield(item)
        selected_elem.push(item)
      end
    end
    return selected_elem
  end

end
# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self
         yield item
   end
    end
  end
  # Define my_each here

