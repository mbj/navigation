module Navigation
  # Collection of navigation items
  class Collection
    include Adamantium::Flat, Composition.new(:items)

    # Return html
    #
    # @param [Joy::Request] request
    #
    # @return [HTML::Fragment]
    #
    # @api private
    #
    def render(request)
      children = items.map { |item| item.render(request) }
      HTML.ul(HTML.join(children))
    end

    EMPTY = new([])

  end
end
