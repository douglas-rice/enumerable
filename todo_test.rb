require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todo'


class TodoTest < MiniTest::Unit::TestCase
  def setup
    @list = TodoList.new
  end

  def test_todo_empty
    assert_equal(@list.empty?, true)
  end

  def test_todo_1
    @list.add("Buy milk")
    assert_equal(@list.size, 1)
  end

  def test_todo_1_message
    @list.add("Buy milk")
    assert_equal(@list.first, 'Buy milk')
  end

  def test_todo_each
    @list << "Clean room"
    @list << "Attend live session"

    new_array = []
    @list.each {|todo| new_array << todo }
    assert_equal(new_array, ['Clean room', 'Attend live session'])
  end

  def test_each_return_value
    @list << "Clean room"
    @list << "Attend live session"

    new_array = []
    ret_val = @list.each {|todo| new_array << todo }
    assert_equal(@list, ret_val)
  end

  def test_todo_any_buy
    @list << "Buy milk"
    @list << "Clean room"
    @list << "Attend live session"

    has_buy = @list.any? { |todo| todo =~ /^Buy/ }

    assert_equal(true, has_buy)
  end

  def test_todo_select   # important!!
    @list << "Buy milk"
    @list << "Clean room"
    @list << "Attend live session"

    buy_list = @list.select { |todo| todo =~ /^Buy/ }

    assert_equal(['Buy milk'], buy_list)
  end
end
