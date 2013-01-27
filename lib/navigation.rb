require 'adamantium'
require 'composition'
require 'equalizer'
require 'anima'
require 'html'

# Library namespace
module Navigation

  # Build navigation
  #
  # @return [Collection]
  #
  # @api private
  #
  def self.build(&block)
    Builder.run(&block)
  end

end

require 'navigation/item'
require 'navigation/collection'
require 'navigation/builder'
