class Report < ActiveRecord::Base

  hobo_model # Don't put anything above this
  # private static final String TYPE_PDF = "pdf";
  # private static final String TYPE_XML = "xml";
  # private static final String TYPE_RTF = "rtf";
  # private static final String TYPE_XLS = "xls";
  # private static final String TYPE_CSV = "csv";
  FILE_TYPES = HoboFields::Types::EnumString.for(:pdf, :xml, :rtf, :xls, :csv)
  # REPORT_TYPES = HoboFields::Types::EnumString.for('project/BulkSampleLog', 
                                                   # 'organization/OrganizationMaterials')
  REPORT_TYPES = HoboFields::Types::EnumString.for() 
                                                   
  # Use of REPORT_INCLUDES is optional but advised
  # first it activates eager loading so lest number of sql queries will be run when generating the report
  # second it enables the end user to filter on sub tables that are listed in the includes
  # REPORT_INCLUDES = {'BulkSampleLog' => [{:samples=>{:location=>:location_name}} , 
                                         # {:samples=>{:field_tech=>:licences, :material=>:building}},
                                          # :organization],
                     # 'OrganizationMaterials' => [:buildings => 
                                                  # {:floors => 
                                                    # { :spaces => 
                                                      # {:locations => 
                                                        # [{ :location_materials => :material}, :location_name]
                                                      # }
                                                    # }
                                                  # }
                                                # ]
                    # }
  REPORT_INCLUDES = {}
  
  fields do
    name :string, :required
    report_action Report::REPORT_TYPES, :required
    report_query_string :string
    filter :string
    output_file_name :string
    output_file_type Report::FILE_TYPES
    timestamps
  end

  has_attached_file :jasperreport, :path => ":rails_root/jasper_reports/:attachment/:id/:style/:filename"
  
  # validates_attachment_presence :jasperreport
  validates_attachment_content_type :jasperreport, :content_type => ['application/octet-stream']
  
  scope :for_model, lambda { |m, admin|
    if admin
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
