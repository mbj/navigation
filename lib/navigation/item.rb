module Navigation
  # Item of a navigation
  class Item
    include Adamantium::Flat, Anima.new(:name, :label, :params, :children)

    # Return html
    #
    # @param [#generate_path,#current_path] context
    #
    # @param [Joy::Request] request
    #
    # @return [HTML::Fragment]
    #
    # @api private
    #
    def render(context)
      path = context.generate_path(name, params)
      attributes = { :href => path }
      if context.current_path == path
        attributes[:class] = :active
      end
      a = HTML.a(label, attributes)
      HTML.join([a, children.render(context)])
    end

  end # Item
end # Navigation
