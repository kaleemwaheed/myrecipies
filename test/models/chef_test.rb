require 'test_helper'
class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef=Chef.new(chefname:"kaka", email:"abcd@email.com")
  end
 # test "chefname should be valid" do
  #  assert @recipe.valid?
  #end
  test " chefname must be present" do
    @chef.chefname= " "
    assert_not @chef.valid?
  end
  test "chefname should not be not long" do
      @chef.chefname="a"*26
      assert_not @chef.valid?
  end
  
  test " chefname not be too short" do
    @chef.chefname="aaaa"
    assert_not @chef.valid?
  end
  
    test "email should be present" do
    @chef.email=" "
    assert_not @chef.valid?
  end
    test "email should be bound" do
    @chef.chefname="a"*104 + "@example.com"
    assert_not @chef.valid?
  end
    test "email should be unique" do
      dup_chef = @chef.dup
      dup_chef.email=@chef.email.upcase
      @chef.save
      assert_not dup_chef.valid?
  end
  #test "email must have valid email adress" do
   # valid = %w[ABCDE2@exam.com]
    #valid.each do |va|
     # @chef.email=va
      #assert @chef.valid? #,"#{va.inspect} sould be valid"
   # end
  #end
  test "rejected email adress" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |iva|
      @chef.email = iva
      assert_not @chef.valid?, "#{iva.inspect} should be invalid"
    end
  end
  
end
