# frozen_string_literal: true

require 'sdoc'
require 'rdoc/task'

namespace :doc do
  RDoc::Task.new('app') do |rdoc|
    rdoc.rdoc_dir = 'docs'
    rdoc.title = ENV['title'] || 'Rails Application Documentation'
    rdoc.options << '--format=sdoc' # explictly set the sdoc generator
    rdoc.template = 'rails'         # template used on api.rubyonrails.org
    rdoc.options << '--line-numbers'
    rdoc.options << '--charset' << 'utf-8'
    rdoc.rdoc_files.include('README.md')
    rdoc.rdoc_files.include('app/**/*.rb')
    rdoc.rdoc_files.include('lib/**/*.rb')
  end
  Rake::Task['doc:app'].comment = 'Generate docs for the app -- also available doc:rails, doc:guides (options: TEMPLATE=/rdoc-template.rb, TITLE="Custom Title")'
end
