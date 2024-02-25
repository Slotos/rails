# frozen_string_literal: true

module Arel # :nodoc: all
  module Nodes
    class Grouping < Unary
      def fetch_attribute(&block)
        expr.fetch_attribute(&block)
      end

      def impossible?
        NodeExpression === @expr && @expr.impossible?
      end
    end
  end
end
