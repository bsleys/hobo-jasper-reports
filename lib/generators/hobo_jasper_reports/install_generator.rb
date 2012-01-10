module HoboJasperReports
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../../../..', __FILE__)

      desc "Installs Hobo Models and controlers to work with Jasper Reports"
      def install
        base_pathname = Pathname.new(File.expand_path('../../../../app', __FILE__))
        Dir[File.expand_path('../../../../app/**/*.*', __FILE__)].each do |fn|
          rfn=Pathname.new(fn).relative_path_from(base_pathname)
          copy_file "app/#{rfn}", "app/#{rfn}"
        end
      end      
    end
  end
end