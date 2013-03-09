module Navigation
  # Collection of navigation items
  class Collection
    include Adamantium::Flat, Concord.new(:items)

    # Return html
    #
    # @param [Joy::Request] request
    #
    # @return [HTML::Fragment]
    #
    # @api private
    #
    def render(request)
      return HTML::Fragment::EMPTY if empty?

      children = items.map do |item| 
        HTML.li(item.render(request))
      end

      HTML.ul(HTML.join(children))
    end

  private

    # Test if collection is empty
    #
    # @return [true]
    #   if collection is empty
    #
    # @return [false]
    #   otherwise
    #
    # @api private
    #
    def empty?
      items.empty?
    end

    EMPTY = new([])

  end
end
