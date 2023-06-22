# typed: strict

require_relative "imitates_type/ensures_imitation_support"
require_relative "imitates_type/makes_double"

module Mocktail
  class ImitatesType
    extend T::Sig
    extend T::Generic

    sig { void }
    def initialize
      @ensures_imitation_support = T.let(EnsuresImitationSupport.new, EnsuresImitationSupport)
      @makes_double = T.let(MakesDouble.new, MakesDouble)
    end

    sig {
      type_parameters(:T)
        .params(type: T::Class[T.type_parameter(:T)])
        .returns(T.type_parameter(:T))
    }
    def imitate(type)
      @ensures_imitation_support.ensure(type)
      T.cast(@makes_double.make(type).tap do |double|
        Mocktail.cabinet.store_double(double)
      end.dry_instance, T.type_parameter(:T))
    end
  end
end
