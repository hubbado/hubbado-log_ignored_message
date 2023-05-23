Gem::Specification.new do |s|
  s.name = "hubbado-log_ignored_message"
  s.version = "1.0.0"
  s.summary = "Logs that a Eventide message has been ignored "

  s.authors = ["sam@hubbado.com"]
  s.homepage = "https://github.com/hubbado/hubbado-log_ignored_message"
  s.licenses = ["MIT"]

  s.require_paths = ["lib"]
  s.files = Dir.glob("{lib}/**/*")
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = ">= 3.0"

  s.add_runtime_dependency 'evt-configure'
  s.add_runtime_dependency 'evt-log'

  s.add_development_dependency 'evt-identifier-uuid'
  s.add_development_dependency "hubbado-style"
  s.add_development_dependency 'evt-messaging'
  s.add_development_dependency 'test_bench'
end
