# frozen_string_literal: true

module Arel # :nodoc: all
  module Nodes
    class Equality < Arel::Nodes::Binary
      include FetchAttribute

      def equality?; true; end

      def invert
        Arel::Nodes::NotEqual.new(left, right)
      end

      def impossible?
        right.respond_to?(:unboundable?) && right.unboundable?
      end
    end

    class NotEqual < Binary
      include FetchAttribute

      def invert
        Arel::Nodes::Equality.new(left, right)
      end

      def tautological?
        right.respond_to?(:unboundable?) && right.unboundable?
      end
    end
  end
end
