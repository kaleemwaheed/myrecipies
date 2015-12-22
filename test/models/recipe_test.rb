require 'test_helper'
class RecipeTest < ActiveSupport::TestCase
  def setup
      @recipe = Recipe.new(name:"kaleem", summary:"hello dffdf", description: "hlloe2 dfdfd") 
  end
  
  test "Recipe should be valid" do
    assert @recipe.valid?
  end
  test "Test name should be present" do
   @recipe.name = " "
   assert_not @recipe.valid?
  end
  test "name shoulb not be long" do 
    @recipe.name = "a"*101
    assert_not @recipe.valid?
 
  end
  test "name shoulb not be short" do 
    @recipe.name="aaaa"
    assert_not @recipe.valid?
  end
  test "summary should be present" do 
    @recipe.summary= " "
    assert_not @recipe.valid?
 
  end
  test "summary shoulb not be long" do 
     @recipe.summary = "a"*101
    assert_not @recipe.valid?
 
  end
  
  test "sammary shoulb not be short" do 
   @recipe.summary = "aaaa"
    assert_not @recipe.valid?
  end
  
   test "description should be present" do 
     @recipe.description = " "
   assert_not @recipe.valid?
      
  end
   test "description shoulb not be long" do 
      @recipe.description = "a"*51
      assert_not @recipe.valid?
  end
   
  test "description shoulb not be short" do 
      @recipe.description = "aaaa"
      assert_not @recipe.valid?
  end
  
  
end