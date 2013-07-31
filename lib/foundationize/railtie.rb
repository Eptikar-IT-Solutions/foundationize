require 'foundationize/foundationize_viewhelpers'

module Foundationize
  class Railtie < Rails::Railtie
    initializer "foundationize.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end