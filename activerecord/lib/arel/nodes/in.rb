# frozen_string_literal: true

module Arel # :nodoc: all
  module Nodes
    class In < Arel::Nodes::Binary
      include FetchAttribute

      def equality?; true; end

      def invert
        Arel::Nodes::NotIn.new(left, right)
      end

      def impossible?
        Array === right && right.empty?
      end
    end
  end
end
