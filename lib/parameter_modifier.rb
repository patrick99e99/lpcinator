module LPCinator
  class ParameterModifier

    def self.value_for(original, target, options)
      return original unless target
      new(original, target, options).return_value
    end

    def initialize(original, target, options)
      @original = original
      @target   = target
      @min      = options.fetch(:min)
      @max      = options.fetch(:max)
    end

    def return_value
      if original < min
        less_than_min_case
      elsif original > max
        more_than_max_case
      elsif add?
        add_case
      elsif subtract?
        subtract_case
      else
        value_case
      end
    end

  private

    def value_case
      if amount < min
        min
      elsif amount > max
        max
      else
        amount
      end
    end

    def less_than_min_case
      add? ? add_case : original
    end

    def more_than_max_case
      subtract? ? subtract_case : original
    end

    def add_case
      (original + amount) > max ? max : (original + amount)
    end

    def subtract_case
      (original - amount) < min ? min : (original - amount)
    end

    def amount
      target.scan(/\d+/).first.to_i
    end

    def add?
      !!(/add/ =~ target)
    end

    def subtract?
      !!(/sub/ =~ target)
    end

    attr_reader :original, :target, :min, :max
  end
end
