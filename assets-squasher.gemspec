#!/usr/bin/env gem build

Gem::Specification.new do |s|
  s.name              = 'assets-squasher'
  s.version           = '0.0.1'
  s.date              = Date.today.to_s
  s.authors           = ['https://github.com/botanicus']
  s.summary           = "Assets squasher for single page apps."
  s.description       = "It takes an HTML file, traverses over its scripts and stylesheets and minify them all into one file using UglifyJS2 and UglifyCSS. Meant primarily for single page apps."
  s.email             = 'james@101ideas.cz'
  s.homepage          = 'https://github.com/botanicus/assets-squasher'
  s.rubyforge_project = s.name
  s.license           = 'MIT'

  s.files             = ['README.md', 'bin/assets-squasher']
  s.executables       = ['assets-squasher']

  s.add_runtime_dependency('nokogiri', '~> 1.6')
end
