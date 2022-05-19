# typed: true
require "test_helper"

module Mocktail::Matchers
  class BaseTest < Minitest::Test
    def test_default_method_stubs
      subject = Base.new(:an_arg)

      e = assert_raises(Mocktail::Error) { Base.matcher_name }
      assert_equal "The `matcher_name` class method must return a valid method name", e.message

      e = assert_raises(Mocktail::Error) { subject.match?(:other_arg) }
      assert_equal "Matchers must implement `match?(argument)`", e.message

      assert subject.is_mocktail_matcher?
    end
  end
end
