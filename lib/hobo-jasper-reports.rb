$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module HoboJasperReports
  VERSION = File.read(File.expand_path('../../VERSION', __FILE__)).strip
  @@root = Pathname.new File.expand_path('../..', __FILE__)
  def self.root; @@root; end
end