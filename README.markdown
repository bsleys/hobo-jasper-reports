# hobo-jasper-reports

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

## INSTALL:

Add the following line to your gemfile

    gem 'hobo-jasper-reports', :git => 'git://github.com/bsleys/hobo-jasper-reports.git'
  
And then run
   
    bundle install
    rails generate hobo_jasper_reports:install


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