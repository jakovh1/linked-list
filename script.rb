# frozen_string_literal: true

require_relative './linked_list'
require_relative './node'

list = LinkedList.new
list.append(10)
list.append(20)
list.append(30)
list.append(40)
list.to_s

list.pop

list.to_s
list.append(100)
list.append(2000)
list.to_s

list.insert_at(50, 3)
list.to_s

list.remove_at(5)
list.to_s
