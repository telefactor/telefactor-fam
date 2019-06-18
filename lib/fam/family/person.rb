# frozen_string_literal: true

class Fam::Family
  class Person
    def self.from_h(input_hash)
      new(
        name: input_hash.fetch(:name)
      )
    end

    def initialize(name:)
      @name = name
    end

    attr_reader :name
  end
end
