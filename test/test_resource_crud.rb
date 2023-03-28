require "minitest/autorun"
require "resource_crud"

class ResourceCrudTest < Minitest::Test
  def test_types
    res = ResourceCrud.new("Resource", name: "string", age: "number")
    assert_equal "String",
      res.class
  end
end