require 'minitest/autorun'
require_relative 'createUser.rb'

class TestCreateUser < MiniTest::Test

  def setup
    @person = CreateUser.new('Dave', 'Jones')
  end

  def test_class_exists
    assert_kind_of( CreateUser, @person, 'Person class not created correctly' )
  end

  def test_to_s
    assert_equal( 'First: Dave, Last: Jones', @person.to_s, "to_s doesn't work correctly" )
  end

  def test_switch
    @person.switch
    assert_equal( 'Dave', @person.last )
    assert_equal( 'Jones', @person.first )
  end

  def test_accessors
    assert_equal( 'Dave', @person.first)
    assert_equal( 'Jones', @person.last)

    @person.first = 'Joe'
    assert_equal( 'Joe', @person.first)

    @person.last = 'Smith'
    assert_equal( 'Smith', @person.last)

    assert_equal( '', @person.email)
  end

  def test_GetDBUserEmail
    @person.GetDBUserEmail
    assert_equal( 'Dave.Jones@lockersoft.com', @person.email )
  end

end