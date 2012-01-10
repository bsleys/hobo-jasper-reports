class Report < ActiveRecord::Base

  hobo_model # Don't put anything above this
  # output types defined in XmlJasperInterface
  # private static final String TYPE_PDF = "pdf";
  # private static final String TYPE_XML = "xml";
  # private static final String TYPE_RTF = "rtf";
  # private static final String TYPE_XLS = "xls";
  # private static final String TYPE_CSV = "csv";
  FILE_TYPES = HoboFields::Types::EnumString.for(:pdf, :xml, :rtf, :xls, :csv)
  # change report types to work with your models and xml views.
  # format is singulare or plural model name / xml view stored in app/views/reports/*.rxml
  # eg.
  #   project/BulkSampleLog => 
  #           generates a report on the Project model using the view BuildSampleLog.rxml
  REPORT_TYPES = HoboFields::Types::EnumString.for('project/BulkSampleLog', 'projects/ProjectList')
  fields do
    name :string, :required
    report_action Report::REPORT_TYPES, :required
    report_query_string :string, :required
    include :string
    filter :string
    output_file_name :string, :required
    output_file_type Report::FILE_TYPES, :required
    
    timestamps
  end

  has_attached_file :jasperreport
  
  # validates_attachment_presence :jasperreport
  validates_attachment_content_type :jasperreport, :content_type => ['application/octet-stream'],
  :path => ":rails_root/jasper_reports/:attachment/:id/:style/:filename"
  
  scope :for_model, lambda { |m, includexml|
    if includexml
      hidexml = ""
    else
      hidexml = "jasperreport_file_name is not NULL and "
    end
    where("#{hidexml}report_action like ?", "#{m}/%").
        order(:name)
  }
  
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
