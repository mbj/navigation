module Navigation

  # Navigation builder
  class Builder
    include Equalizer.new(:items)

    # Build collection
    #
    # @return [Collection]
    #
    # @api private
    #
    def self.run(&block)
      instance = new
      yield(instance)
      Navigation::Collection.new(instance.items)
    end

    # Return items
    #
    # @return [Array<Item>]
    #
    # @api private
    #
    attr_reader :items

    # Initialize object
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize
      @items = []
    end

    # Build item
    #
    # @param [Symbol] name
    # @param [String] label
    # @param [Hash]   params
    #
    # @return [self]
    #
    # @api private
    #
    def item(name, label, params = {}, &block)
      children = if block
                   Builder.run(&block) 
                 else
                   Collection::EMPTY
                 end

      items << Item.new(
        :name => name, 
        :label => label, 
        :params => params, 
        :children => children
      )

      self
    end
  end

end
