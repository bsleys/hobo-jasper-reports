class Document
  include Config
  def self.generate_report(xml_data, report_design, output_type, select_criteria)
    report_design << '.jasper' if !report_design.match(/\.jasper$/)
    
    interface_classpath="#{HoboJasperReports.root}/jasper_reports/bin"
    case CONFIG['host']
      when /mswin32/
        mode = "w+b" #windows requires binary mode
        Dir.foreach("#{HoboJasperReports.root}/jasper_reports/lib") do |file|
          interface_classpath << ";#{HoboJasperReports.root}/jasper_reports/lib/" + file if (file != '.' and file != '..' and file.match(/.jar/))
        end
      else
        mode = "w+b"
        Dir.foreach("#{HoboJasperReports.root}/jasper_reports/lib") do |file|
          interface_classpath << ":#{HoboJasperReports.root}/jasper_reports/lib/" + file if (file != '.' and file != '..' and file.match(/.jar/))
        end
    end
		result=nil
		IO.popen "java -Djava.awt.headless=true -cp \"#{interface_classpath}\" XmlJasperInterface -o#{output_type} -f#{report_design} -x#{select_criteria}", mode do |pipe|
			pipe.write xml_data
			pipe.close_write
			result = pipe.read
			pipe.close
		end
    return result
  end
end