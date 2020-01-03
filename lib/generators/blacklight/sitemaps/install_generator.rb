# frozen_string_literal: true

require 'rails/generators'

module Blacklight::Sitemaps
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install_sitemap_controller
      copy_file 'sitemap_controller.rb', 'app/controllers/sitemap_controller.rb'
    end

    def install_routing_concern
      route('resources :sitemap, defaults: { format: :xml }, only: [:index, :show]')
    end
  end
end
