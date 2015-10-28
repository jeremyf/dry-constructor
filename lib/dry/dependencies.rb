require 'thread_safe'
require 'dry/dependencies/version'

# A collection of micro-libraries, each intended to encapsulate
# a common task in Ruby
module Dry
  # A simple dependency injection macro for Plain Old Ruby Objects
  #
  # @example
  #
  #   class UsersController
  #     include Dry::Dependencies
  #     dependencies :response, :validator, :command
  #   end
  #
  #   # assign response, validator and command
  #
  #   UsersController.new(response, validator, command)
  #
  # @api public
  module Dependencies
    # @private
    def self.included(base)
      base.__send__(:instance_variable_set, :@dependencies, [])
      base.__send__(:extend, ClassMethods)
    end

    # @private
    def initialize(*dependencies)
      self.class.dependencies.each.with_index do |dependency, index|
        instance_variable_set("@#{dependency}", dependencies[index])
      end
    end

    module ClassMethods
      # @private
      def inherited(subclass)
        subclass.__send__(:instance_variable_set, :@dependencies, @dependencies)
      end

      # Add (constructor-injected) dependencies
      #
      # @overload dependencies(dependency, ...)
      #   @param [String|Symbol] dependency The name of the first dependency
      #   @param [String|Symbol] ... Subsequent dependencies
      #
      # @api public
      def dependencies(*dependencies, visibility: :public)
        if dependencies.any?
          __send__(:attr_reader, *dependencies)
          __send__(visibility, *dependencies)
          @dependencies += dependencies
        end

        @dependencies
      end
    end
  end
end
