name = File.basename( __FILE__, '.gemspec' )
version = File.read(File.expand_path('../VERSION', __FILE__)).strip

spec = Gem::Specification.new do |s|
  s.name = name
  s.version = version
  s.summary = "Jasper Reports support for Hobo"
  s.description = "Jasper Reports support for Hobo"
  s.author = "Bob Sleys"
  s.email = "bsleys@gmail.com"
  s.files = `git ls-files -x #{name}/* -z`.split("\0")

end