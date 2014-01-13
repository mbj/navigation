#encoding: utf-8

Gem::Specification.new do |s|
  s.name        = 'navigation'
  s.version     = '0.0.1'
  s.authors     = ['Markus Schirp']
  s.email       = ['mbj@schir-dso.com']
  s.homepage    = 'https://github.com/mbj/navigation'
  s.summary     = %q{Build web navigations}
  s.description = %q{Build web navigations and nothing else}

  # git ls-files
  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = []
  s.require_paths = ['lib']

  s.add_dependency('anima',       '~> 0.2.0')
  s.add_dependency('adamantium',  '~> 0.1.0')
  s.add_dependency('equalizer',   '~> 0.0.7')
  s.add_dependency('concord',     '~> 0.1.4')
  s.add_dependency('html',        '~> 0.1.0')
end
