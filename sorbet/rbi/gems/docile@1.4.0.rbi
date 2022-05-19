# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `docile` gem.
# Please instead update this file by running `bin/tapioca gem docile`.

# Docile keeps your Ruby DSLs tame and well-behaved.
module Docile
  extend ::Docile::Execution

  private

  # Execute a block in the context of an object whose methods represent the
  # commands in a DSL.
  #
  # Use this method to execute an *imperative* DSL, which means that:
  #
  #   1. Each command mutates the state of the DSL context object
  #   2. The return value of each command is ignored
  #   3. The final return value is the original context object
  #
  # @example Use a String as a DSL
  #   Docile.dsl_eval("Hello, world!") do
  #   reverse!
  #   upcase!
  #   end
  #   #=> "!DLROW ,OLLEH"
  # @example Use an Array as a DSL
  #   Docile.dsl_eval([]) do
  #   push 1
  #   push 2
  #   pop
  #   push 3
  #   end
  #   #=> [1, 3]
  # @note Use with an *imperative* DSL (commands modify the context object)
  # @param dsl [Object] context object whose methods make up the DSL
  # @param args [Array] arguments to be passed to the block
  # @param block [Proc] the block of DSL commands to be executed against the
  #   `dsl` context object
  # @return [Object] the `dsl` context object after executing the block
  def dsl_eval(dsl, *args, **_arg2, &block); end

  # Execute a block in the context of an immutable object whose methods,
  # and the methods of their return values, represent the commands in a DSL.
  #
  # Use this method to execute a *functional* DSL, which means that:
  #
  #   1. The original DSL context object is never mutated
  #   2. Each command returns the next DSL context object
  #   3. The final return value is the value returned by the last command
  #
  # @example Use a frozen String as a DSL
  #   Docile.dsl_eval_immutable("I'm immutable!".freeze) do
  #   reverse
  #   upcase
  #   end
  #   #=> "!ELBATUMMI M'I"
  # @example Use a Float as a DSL
  #   Docile.dsl_eval_immutable(84.5) do
  #   fdiv(2)
  #   floor
  #   end
  #   #=> 42
  # @note Use with a *functional* DSL (commands return successor
  #   context objects)
  # @param dsl [Object] immutable context object whose methods make up the
  #   initial DSL
  # @param args [Array] arguments to be passed to the block
  # @param block [Proc] the block of DSL commands to be executed against the
  #   `dsl` context object and successor return values
  # @return [Object] the return value of the final command in the block
  def dsl_eval_immutable(dsl, *args, **_arg2, &block); end

  # Execute a block in the context of an object whose methods represent the
  # commands in a DSL, and return *the block's return value*.
  #
  # Use this method to execute an *imperative* DSL, which means that:
  #
  #   1. Each command mutates the state of the DSL context object
  #   2. The return value of each command is ignored
  #   3. The final return value is the original context object
  #
  # @example Use a String as a DSL
  #   Docile.dsl_eval_with_block_return("Hello, world!") do
  #   reverse!
  #   upcase!
  #   first
  #   end
  #   #=> "!"
  # @example Use an Array as a DSL
  #   Docile.dsl_eval_with_block_return([]) do
  #   push "a"
  #   push "b"
  #   pop
  #   push "c"
  #   length
  #   end
  #   #=> 2
  # @note Use with an *imperative* DSL (commands modify the context object)
  # @param dsl [Object] context object whose methods make up the DSL
  # @param args [Array] arguments to be passed to the block
  # @param block [Proc] the block of DSL commands to be executed against the
  #   `dsl` context object
  # @return [Object] the return value from executing the block
  def dsl_eval_with_block_return(dsl, *args, **_arg2, &block); end

  class << self
    # Execute a block in the context of an object whose methods represent the
    # commands in a DSL.
    #
    # Use this method to execute an *imperative* DSL, which means that:
    #
    #   1. Each command mutates the state of the DSL context object
    #   2. The return value of each command is ignored
    #   3. The final return value is the original context object
    #
    # @example Use a String as a DSL
    #   Docile.dsl_eval("Hello, world!") do
    #   reverse!
    #   upcase!
    #   end
    #   #=> "!DLROW ,OLLEH"
    # @example Use an Array as a DSL
    #   Docile.dsl_eval([]) do
    #   push 1
    #   push 2
    #   pop
    #   push 3
    #   end
    #   #=> [1, 3]
    # @note Use with an *imperative* DSL (commands modify the context object)
    # @param dsl [Object] context object whose methods make up the DSL
    # @param args [Array] arguments to be passed to the block
    # @param block [Proc] the block of DSL commands to be executed against the
    #   `dsl` context object
    # @return [Object] the `dsl` context object after executing the block
    def dsl_eval(dsl, *args, **_arg2, &block); end

    # Execute a block in the context of an immutable object whose methods,
    # and the methods of their return values, represent the commands in a DSL.
    #
    # Use this method to execute a *functional* DSL, which means that:
    #
    #   1. The original DSL context object is never mutated
    #   2. Each command returns the next DSL context object
    #   3. The final return value is the value returned by the last command
    #
    # @example Use a frozen String as a DSL
    #   Docile.dsl_eval_immutable("I'm immutable!".freeze) do
    #   reverse
    #   upcase
    #   end
    #   #=> "!ELBATUMMI M'I"
    # @example Use a Float as a DSL
    #   Docile.dsl_eval_immutable(84.5) do
    #   fdiv(2)
    #   floor
    #   end
    #   #=> 42
    # @note Use with a *functional* DSL (commands return successor
    #   context objects)
    # @param dsl [Object] immutable context object whose methods make up the
    #   initial DSL
    # @param args [Array] arguments to be passed to the block
    # @param block [Proc] the block of DSL commands to be executed against the
    #   `dsl` context object and successor return values
    # @return [Object] the return value of the final command in the block
    def dsl_eval_immutable(dsl, *args, **_arg2, &block); end

    # Execute a block in the context of an object whose methods represent the
    # commands in a DSL, and return *the block's return value*.
    #
    # Use this method to execute an *imperative* DSL, which means that:
    #
    #   1. Each command mutates the state of the DSL context object
    #   2. The return value of each command is ignored
    #   3. The final return value is the original context object
    #
    # @example Use a String as a DSL
    #   Docile.dsl_eval_with_block_return("Hello, world!") do
    #   reverse!
    #   upcase!
    #   first
    #   end
    #   #=> "!"
    # @example Use an Array as a DSL
    #   Docile.dsl_eval_with_block_return([]) do
    #   push "a"
    #   push "b"
    #   pop
    #   push "c"
    #   length
    #   end
    #   #=> 2
    # @note Use with an *imperative* DSL (commands modify the context object)
    # @param dsl [Object] context object whose methods make up the DSL
    # @param args [Array] arguments to be passed to the block
    # @param block [Proc] the block of DSL commands to be executed against the
    #   `dsl` context object
    # @return [Object] the return value from executing the block
    def dsl_eval_with_block_return(dsl, *args, **_arg2, &block); end
  end
end

# This is used to remove entries pointing to Docile's source files
# from {Exception#backtrace} and {Exception#backtrace_locations}.
#
# If {NoMethodError} is caught then the exception object will be extended
# by this module to add filter functionalities.
#
# @api private
module Docile::BacktraceFilter
  # @api private
  def backtrace; end

  # @api private
  def backtrace_locations; end
end

# @api private
Docile::BacktraceFilter::FILTER_PATTERN = T.let(T.unsafe(nil), Regexp)

# Operates in the same manner as {FallbackContextProxy}, but replacing
# the primary `receiver` object with the result of each proxied method.
#
# This is useful for implementing DSL evaluation for immutable context
# objects.
#
#
# @api private
# @see Docile.dsl_eval_immutable
class Docile::ChainingFallbackContextProxy < ::Docile::FallbackContextProxy
  # Proxy methods as in {FallbackContextProxy#method_missing}, replacing
  # `receiver` with the returned value.
  #
  # @api private
  def method_missing(method, *args, **_arg2, &block); end
end

# A namespace for functions relating to the execution of a block against a
# proxy object.
#
# @api private
module Docile::Execution
  private

  # Execute a block in the context of an object whose methods represent the
  # commands in a DSL, using a specific proxy class.
  #
  # @api private
  # @param dsl [Object] context object whose methods make up the
  #   (initial) DSL
  # @param proxy_type [FallbackContextProxy, ChainingFallbackContextProxy] which class to instantiate as proxy context
  # @param args [Array] arguments to be passed to the block
  # @param block [Proc] the block of DSL commands to be executed
  # @return [Object] the return value of the block
  def exec_in_proxy_context(dsl, proxy_type, *args, **_arg3, &block); end

  class << self
    # Execute a block in the context of an object whose methods represent the
    # commands in a DSL, using a specific proxy class.
    #
    # @api private
    # @param dsl [Object] context object whose methods make up the
    #   (initial) DSL
    # @param proxy_type [FallbackContextProxy, ChainingFallbackContextProxy] which class to instantiate as proxy context
    # @param args [Array] arguments to be passed to the block
    # @param block [Proc] the block of DSL commands to be executed
    # @return [Object] the return value of the block
    def exec_in_proxy_context(dsl, proxy_type, *args, **_arg3, &block); end
  end
end

# A proxy object with a primary receiver as well as a secondary
# fallback receiver.
#
# Will attempt to forward all method calls first to the primary receiver,
# and then to the fallback receiver if the primary does not handle that
# method.
#
# This is useful for implementing DSL evaluation in the context of an object.
#
#
# @api private
# @see Docile.dsl_eval
class Docile::FallbackContextProxy
  # @api private
  # @param receiver [Object] the primary proxy target to which all methods
  #   initially will be forwarded
  # @param fallback [Object] the fallback proxy target to which any methods
  #   not handled by `receiver` will be forwarded
  # @return [FallbackContextProxy] a new instance of FallbackContextProxy
  def initialize(receiver, fallback); end

  # @api private
  # @return [Array<Symbol>] Instance variable names, excluding
  #   {NON_PROXIED_INSTANCE_VARIABLES}
  def instance_variables; end

  # Proxy all methods, excluding {NON_PROXIED_METHODS}, first to `receiver`
  # and then to `fallback` if not found.
  #
  # @api private
  def method_missing(method, *args, **_arg2, &block); end
end

# The set of methods which will **not** fallback from the block's context
# to the dsl object.
#
# @api private
Docile::FallbackContextProxy::NON_FALLBACK_METHODS = T.let(T.unsafe(nil), Set)

# The set of instance variables which are local to this object and hidden.
# All other instance variables will be copied in and out of this object
# from the scope in which this proxy was created.
#
# @api private
Docile::FallbackContextProxy::NON_PROXIED_INSTANCE_VARIABLES = T.let(T.unsafe(nil), Set)

# The set of methods which will **not** be proxied, but instead answered
# by this object directly.
#
# @api private
Docile::FallbackContextProxy::NON_PROXIED_METHODS = T.let(T.unsafe(nil), Set)

# The current version of this library
Docile::VERSION = T.let(T.unsafe(nil), String)
