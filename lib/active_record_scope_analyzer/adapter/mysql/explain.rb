# frozen_string_literal: true

require 'json'

module ActiveRecordScopeAnalyzer
  module Adapter
    module Mysql
      class Explain
        class InValidFormatException; end

        def initialize(result: '', format: :json)
          @format = format
          @result = JSON.parse(result)
        rescue JSON::ParserError
          raise InValidFormatException
        end

        attr_reader :result
      end
    end
  end
end
