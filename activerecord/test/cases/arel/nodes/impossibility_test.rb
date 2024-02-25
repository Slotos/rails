# frozen_string_literal: true

require_relative "../helper"

module Arel
  module Nodes
    class ImpossibilityTest < Arel::Spec
      describe "equality" do
        it "is equal other instances" do
          array = [Impossibility.new, Impossibility.new]
          assert_equal 1, array.uniq.size
        end

        it "is not equal to other node types" do
          array = [Impossibility.new, In.new("a", "b")]
          assert_equal 2, array.uniq.size
        end
      end

      it "is impossible" do
        assert_predicate Impossibility.new, :impossible?
      end
    end
  end
end
