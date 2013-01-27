module Navigation
  # Item of a navigation
  class Item
    include Adamantium::Flat, Anima.new(:name, :label, :params, :children)

    # Return html
    #
    # @param [#generate_path] application
    #
    # @param [Joy::Request] request
    #
    # @return [HTML::Fragment]
    #
    # @api private
    #
    def render(application)
      path = application.generate_path(name, params)
      content = HTML.join([label, children.render(application)])
      a = HTML.a(content, :href => path)
      HTML.li(a)
    end

  end
end
