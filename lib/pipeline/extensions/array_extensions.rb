module Pipeline
  module Extensions
    module ArrayExtensions
      def standard_deviation
        return 0 if empty?
        
        mean = sum / size.to_f
        squared_diffs = map { |value| (value - mean) ** 2 }
        Math.sqrt(squared_diffs.sum / size)
      rescue ZeroDivisionError
        0
      end
    end
  end
end

Array.include Pipeline::Extensions::ArrayExtensions 