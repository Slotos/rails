# frozen_string_literal: true

require_relative "../helper"

module Arel
  module Nodes
    describe "or" do
      describe "#or" do
        it "makes an OR node" do
          attr = Table.new(:users)[:id]
          left  = attr.eq(10)
          right = attr.eq(11)
          node  = left.or right
          _(node.expr.left).must_equal left
          _(node.expr.right).must_equal right

          oror = node.or(right)
          _(oror.expr.left).must_equal node
          _(oror.expr.right).must_equal right
        end
      end
    end

    class OrTest < Arel::Spec
      describe "equality" do
        it "is equal with equal ivars" do
          array = [Or.new("foo", "bar"), Or.new("foo", "bar")]
          assert_equal 1, array.uniq.size
        end

        it "is not equal with different ivars" do
          array = [Or.new("foo", "bar"), Or.new("foo", "baz")]
          assert_equal 2, array.uniq.size
        end
      end

      describe "detects trivial impossibility" do
        it "impossible if all components are impossible" do
          assert_not_predicate Or.new("foo", Impossibility.new), :impossible?
          assert_not_predicate Or.new("foo", In.new(Arel.sql("b"), [])), :impossible?
          assert_predicate Or.new(Impossibility.new, In.new(Arel.sql("b"), [])), :impossible?
        end
      end
    end
  end
end
