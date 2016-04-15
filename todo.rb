class TodoList
  include Enumerable  # allowed me to delete the 'any?' and 'select' methods

  attr_accessor :todos

  def initialize
    @todos = []
  end

  def empty?
    todos.empty?
  end

  def <<(todo)
    todos << todo
  end
  alias_method :add, :<<

  def size
    todos.size
  end

  def first
    todos.first
  end

  def each_2
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def each
    i = 0
    while i < todos.size
      yield(todos[i])
      i += 1
    end
    self
  end

  # def any?
  #   is_any = false
  #   each do |todo|
  #     is_any = !!yield(todo)  # !! converts value to boolean
  #     break if is_any
  #   end
  #   is_any
  # end

  # def select
  #   new_array = []
  #   self.each do |todo|
  #     if yield(todo)
  #       new_array << todo
  #     end
  #   end
  #   new_array
  # end

end