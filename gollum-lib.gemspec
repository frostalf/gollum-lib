Gem::Specification.new do |s|
  s.name        = 'gitlab-gollum-lib'
  s.version     = `cat VERSION`
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.license     = 'MIT'
  s.summary     = "A simple, Git-powered wiki."
  s.description = "A simple, Git-powered wiki with a sweet API and local frontend."
  s.authors     = ["Tom Preston-Werner", "Rick Olson", "Dmitriy Zaporozhets"]
  s.email       = 'dmitriy.zaporozhets@gmail.com'
  s.homepage    = 'https://gitlab.com/gitlab-org/gollum-lib'

  s.add_dependency('gitlab-grit', '~> 2.6.1')
  s.add_dependency('github-markup', ['>= 0.7.5', '< 1.0.0'])
  s.add_dependency('github-markdown', '~> 0.5.3')
  s.add_dependency('sanitize', '~> 2.0.3')
  s.add_dependency('nokogiri', '~> 1.5.9')
  s.add_dependency('stringex', '~> 1.5.1')

  s.files = %w[
    VERSION
    Gemfile
    CHANGELOG
    LICENSE
    README.md
    Rakefile
    docs/sanitization.md
    gollum-lib.gemspec
    lib/gollum-lib.rb
    lib/gollum-lib/blob_entry.rb
    lib/gollum-lib/committer.rb
    lib/gollum-lib/file.rb
    lib/gollum-lib/file_view.rb
    lib/gollum-lib/git_access.rb
    lib/gollum-lib/gitcode.rb
    lib/gollum-lib/grit_ext.rb
    lib/gollum-lib/helpers.rb
    lib/gollum-lib/markup.rb
    lib/gollum-lib/markups.rb
    lib/gollum-lib/page.rb
    lib/gollum-lib/pagination.rb
    lib/gollum-lib/remote_code.rb
    lib/gollum-lib/sanitization.rb
    lib/gollum-lib/web_sequence_diagram.rb
    lib/gollum-lib/wiki.rb
    licenses/licenses.txt
  ]

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
