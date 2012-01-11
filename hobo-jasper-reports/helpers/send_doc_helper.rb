module SendDocHelper
  protected
  def cache_hack
    if request.env['HTTP_USER_AGENT'] =~ /msie/i
      headers['Pragma'] = ''
      headers['Cache-Control'] = ''
    else
      headers['Pragma'] = 'no-cache'
      headers['Cache-Control'] = 'no-cache, must-revalidate'
    end
  end

  def send_doc(xml, xml_start_path, report, filename, output_type = 'pdf')
    # output types from XmlJasperInterface
    # private static final String TYPE_PDF = "pdf";
    # private static final String TYPE_XML = "xml";
    # private static final String TYPE_RTF = "rtf";
    # private static final String TYPE_XLS = "xls";
    # private static final String TYPE_CSV = "csv";
    case output_type
    when 'xml'
      extension = 'xml'
      mime_type = 'text/xlm'
      jasper_type = 'xml'
    when 'rtf'
      extension = 'rtf'
      mime_type = 'application/rtf'
      jasper_type = 'rtf'
    when 'xls'
      extension = 'xls'
      mime_type = 'application/excel'
      jasper_type = 'xls'
    when 'csv'
      extension = 'csv'
      mime_type = 'text/csv'
      jasper_type = 'csv'
    else # pdf
    extension = 'pdf'
    mime_type = 'application/pdf'
    jasper_type = 'pdf'
    end

    cache_hack
    send_data Document.generate_report(xml, report, jasper_type, xml_start_path),
        :filename => "#{filename}.#{extension}", :type => mime_type, :disposition => 'inline'
  end
end