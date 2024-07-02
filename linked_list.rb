class LinkedList
  attr_reader :head

  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = new_node
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
    @size += 1
  end

  def size
    puts @size
  end

  def tail
    current = @head
    current = current.next_node until current.next_node.nil?
    current
  end

  def at(index)
    return 'A provided argument is out of bounds.' if index >= @size || index.negative?

    current = @head
    index.times do
      current = current.next_node
    end
    current
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      result = @head
      @head = nil
    else
      current = @head
      current = current.next_node until current.next_node.next_node.nil?
      result = current.next_node
      current.next_node = nil
    end

    @size -= 1
    result
  end

  def contains?(value)
    current = @head
    return true if current.value == value

    (@size - 1).times do
      current = current.next_node
      return true if current.value == value
    end

    false
  end

  def find(value)
    counter = 0
    current = @head
    return counter if current.value == value

    until current.next_node.nil?
      current = current.next_node
      counter += 1
      return counter if current.value == value
    end

    nil
  end

  def to_s
    current = @head
    print "( #{current.value} )"
    until current.next_node.nil?
      print ' -> '
      current = current.next_node
      print "( #{current.value} )"
    end
    puts ' -> nil '
  end

  def insert_at(value, index)
    current = @head
    (0..index - 1).each do |c|
      current = current.next_node
      c += 1
      if c == (index - 1)
        following = current.next_node
        current.next_node = Node.new(value)
        current.next_node.next_node = following
      end
    end
  end

  def remove_at(index)
    current = @head
    (0..index - 1).each do |c|
      current = current.next_node
      c += 1
      if c == (index - 1)
        current.next_node = current.next_node.next_node
      end
    end
  end
end