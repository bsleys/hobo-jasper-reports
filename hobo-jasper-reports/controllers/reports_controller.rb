class ReportsController < ApplicationController

  hobo_model_controller

  auto_actions :index, :show

  include SendDocHelper
  def show
    hobo_show do
      action = @report.report_action.split('/')
      cid = params[:cid] || ""
      @robj = Kernel.const_get(action[0].singularize.titleize).scoped
      @robj = @robj.where(:id => cid) if !cid.blank?
      @robj = @robj.includes(Report::REPORT_INCLUDES[action[1]]) if Report::REPORT_INCLUDES[action[1]]
      @robj = @robj.where(@report.filter) if !@report.filter.blank? 

      if @report.jasperreport_file_name?
        send_doc(
            render_to_string(action[1], :layout=>false),
            @report.report_query_string,
            @report.jasperreport.path,
            @report.output_file_name,
            @report.output_file_type
            )
      else
        render(action[1], :layout=>false)
      end
    end

  end

end
