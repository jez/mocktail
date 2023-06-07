# typed: true

module Mocktail::DSL
  sig {
    type_parameters(:T)
      .params(
        ignore_block: T.nilable(T::Boolean),
        ignore_extra_args: T.nilable(T::Boolean),
        ignore_arity: T.nilable(T::Boolean),
        times: T.nilable(Integer),
        demo: T.proc.params(matchers: Mocktail::MatcherPresentation).returns(T.type_parameter(:T))
      )
      .returns(Mocktail::Stubbing[T.type_parameter(:T)])
  }
  def stubs(ignore_block: T.unsafe(nil), ignore_extra_args: T.unsafe(nil), ignore_arity: T.unsafe(nil), times: T.unsafe(nil), &demo)
  end
end

class Mocktail::Stubbing < ::Struct
  extend T::Generic
  MethodReturnType = type_member

  sig { params(block: T.proc.returns(MethodReturnType)).void }
  def with(&block)
  end
end

class Mocktail::MatcherPresentation
  sig {
    returns(T.untyped)
  }
  def any
  end

  sig {
    type_parameters(:T)
      .params(expected: T::Class[T.type_parameter(:T)])
      .returns(T.type_parameter(:T))
  }
  def is_a(expected)
  end
end
