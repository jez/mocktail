# typed: true
module Mocktail
  class RedefinesNew
    def initialize
      @handles_dry_new_call = HandlesDryNewCall.new
    end

    def redefine(type)
      type_replacement = TopShelf.instance.type_replacement_for(type)

      if type_replacement.replacement_new.nil?
        type_replacement.original_new = type.method(:new)
        type.singleton_class.send(:undef_method, :new)
        handles_dry_new_call = @handles_dry_new_call
        type.define_singleton_method :new, ->(*args, **kwargs, &block) {
          if TopShelf.instance.new_replaced?(type) ||
              TopShelf.instance.of_next_registered?(type)
            handles_dry_new_call.handle(type, args, kwargs, block)
          else
            type_replacement.original_new.call(*args, **kwargs, &block)
          end
        }
        type_replacement.replacement_new = type.singleton_method(:new)
      end
    end
  end
end
