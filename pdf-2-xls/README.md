# KSolve_RoR

> KSolve_RoR is a working application divided into two parts "PDF To XLS" and "Trap". PDF To XLS is a tool to convert a PDF file into XLS. While Trap is a tool to capture and display HTTP requests.

### Description
KSolve_ROR is a working application divided into two parts "PDF To XLS" and "Trap". Both the tools have their well defined descriptions described in their respective sections. Also this application provided the working link of two other application KSolves_tweet and KSolves_Stripe.

It is developed in September 2014 by [Koduc](http://koduc.com/) team with the help of valuable contributors.

### Working URL
KSolve_ROR : [http://ksolve-ror.herokuapp.com/](http://ksolve-ror.herokuapp.com/)

PDF To XLS : [http://ksolve-ror.herokuapp.com/pdf_to_xls/index](http://ksolve-ror.herokuapp.com/pdf_to_xls/index)

Trap : [http://ksolve-ror.herokuapp.com/mysupersecreturl](http://ksolve-ror.herokuapp.com/mysupersecreturl) 

### Variables Necessary
SECRET_KEY - Application specific secret key. Used `rake secret` to generate a new secret key

## PDF To XLS 
PDF To XLS is a tool to convert a PDF file into XLS.This tool uses two gems "pdf-reader" and "to_xls" for the conversion process. This tool can also be helpful for the generation of XLS of the selected element of the uploaded PDF.

We have declared two gems in the gemfile for this integration.

```ruby
gem 'pdf-reader'
gem 'to_xls'
```

#### Steps to be followed to convert PDF to XLS. 
* Browse a PDF file (For testing purpose use demo.pdf present in the application folder). Click on the Scan PDF button to upload the PDF file.

*  On the next page the uploaded PDF file is displayed on the left side.

* You can download the complete XLS of the PDF file by clicking on the "Download Complete XLS" button.

* You can also select some data and imported that to XLS. For this please select a data first and then click on the "Select Data" button. The selected data is displayed on the right side. Then click on the "Import data to XLS" button to import the selected data in XLS format.

*  Click on the "Clear Data" button to reset the selected data.

## Trap 
Trap is a tool to capture and display HTTP requests. This tool is useful during the development of apps that integrate with external services like webhooks etc. This Request Trap app provides these external services with an endpoint to which they can send requests and notifications. 

#### Steps to be followed to Trap a Request.
* Click on any of the Secret URLs to trap a request.

* Clicking on any of the link, your request will be trapped.

* On the next page you will see "Ahh! Your request is trapped... Click on the REQUESTS to Track the requests.". Now click on the REQUESTS to see the requests made to this particular Trap ID.

* Clicking on any of the request, request details will be displayed.

## Queries and Issues 

Your valuable queries and suggestions are welcomed. Please report the issues on GitHub at https://github.com/kartiksolves/KSolve_RoR

## Contact 

If you have any query, need support or advice just DROP us a line and we’ll be in touch very soon.

Email: support@koduc.com

You can also contact us at +91-120-4540178

We’d love to hear from you! :) :)
