# typed: true
require "test_helper"

module Mocktail
  class CleansBacktraceTest < Minitest::Test
    def setup
      @subject = CleansBacktrace.new
    end

    def test_already_clean_backtrace
      error = make_error
      original = error.backtrace.dup

      @subject.clean(error)

      assert_equal original, error.backtrace
    end

    def test_one_prepended_frame
      internal_frames = [
        "lib/mocktail/mocktail.rb:22:in `of'"
      ]
      error = make_error(
        prepend: internal_frames
      )
      original = error.backtrace.dup

      @subject.clean(error)

      assert_equal original.reject { |frame|
        internal_frames.any? { |internal_frame|
          frame.include?(internal_frame)
        }
      }, error.backtrace
    end

    def test_only_removes_prepended_frames
      prepended_frames = [
        "lib/mocktail/mocktail.rb:22:in `of'",
        "lib/mocktail/mocktail/stuff.rb:425:in (run)",
        "lib/mocktail/mocktail/things/and/cool.rb"
      ]
      error = make_error(
        prepend: prepended_frames,
        append: [
          "lib/mocktail/how/could/this/happen.rb:11:in `sure'"
        ]
      )
      original = error.backtrace.dup

      @subject.clean(error)

      assert_equal original.reject { |frame|
        prepended_frames.any? { |internal_frame|
          frame.include?(internal_frame)
        }
      }, error.backtrace
    end

    private

    def make_error(prepend: [], append: [])
      raise Error.new
    rescue => e
      e.tap do |e|
        e.set_backtrace(
          prepend.map { |path| File.join(Dir.pwd, path) } +
          e.backtrace +
          append.map { |path| File.join(Dir.pwd, path) }
        )
      end
    end
  end
end
