# Hobo JasperReports

* http://github.com/bsleys/hobo-jasper-reports

## DESCRIPTION:

Add JasperReports (http://jasperforge.org/) reporting to a Hobo app

iReport Designer is required to generate the report templates.

Gem developed with iReport 4.1.3

The gem is heavly based on the work here http://oldwiki.rubyonrails.org/rails/pages/HowtoIntegrateJasperReports

## FEATURES/PROBLEMS:

 * Report model to store info about reports
 * Report admin controler to setup and upload iReport report designs
 * Report controler to show report via hobo_show action
 * Document model to generate report
 * send_doc_helper used in report controler to aid in generating report  

## REQUIREMENTS:

 * Java is require to run the reports
 * paperlip ~> 2.3
 * paperclip_with_hobo is required see (http://cookbook.hobocentral.net/plugins/paperclip_with_hobo)

## INSTALL:

Add the following line to your gemfile

    gem 'hobo-jasper-reports', :git => 'git://github.com/bsleys/hobo-jasper-reports.git'
  
And then run
   
    bundle install
    rails generate hobo_jasper_reports:install
    bundle exec hobo g migration

Add the following to your application.dryml:

    <include gem="hobo-jasper-reports"/>

## USAGE:

Edit REPORT_TYPES in report.rb model to setup new XML datasources for your reports.

There are two parts to each report type <model>/<xmlview> (described below).  This is hard coded to a enum field because
each model you wish to report on will need one or more xml datasources created and since this has to be done manualy
anyway adding the appropriate string here seems to make sense.

The model can be specified in either plural or sigular form.  This is useful if say on the index view of a model
you want to be able to generate reports for all the models records you could use the plural form of the model name.
Then on the show view of a specific record you should use the singular form of the model.

The xmlview portion is the filename of an .rxml file stored in view/reports.

The report model has the following fields

name - Name of the report this is used in views etc.
report_action - hold the REPORT_TYPES described above
report_query_string - XML query string used in generating the report
include - advanced optional option to include needed sub tables if specifying a filter
filter - filter or where clause for database query
output_file_name - file name the report will be download to
output_file_type - file type the report will be exported to (:pdf, :xml, :rtf, :xls, :csv)

## LICENSE:

Copyright (c) 2012 Bob Sleys

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.