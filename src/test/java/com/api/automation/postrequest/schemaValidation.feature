Feature: Validate the JSON schema
     To validate he JSON schema for POST /normal/webapi/add
     
     
  Background: Create and Initialize Base Url
     Given url 'http://localhost:9897'
     
  Scenario: To create the job entry in JSON format
     Given path '/normal/webapi/add'
     * def body = read("data/jobEntry.json")
     And request body
     And headers {Accept: 'application/json', Content-Type: 'application/json'}
     When method post
     Then status 201
     And match response == 
     """
     {
     "jobId": '#number',
     "jobTitle": '#string',
     "jobDescription": '#string',
     "experience": '#[] #string',
     "project": '#[] #object'
     }
     """
     
    Scenario: Schema Validation for Get End point
     Given path '/normal/webapi/all'
     And header Accept = 'application/json'
     When method get
     Then status 200
     * def projectSchema = {"projectName": '#string', "technology": '#[] #string'}
     * def mainSchema = {"jobId": '#number', "jobTitle": '#string', "jobDescription": '#string', "experience": '#[] #string', "project": '#[] ##(projectSchema)'}
     And match response == 
     """
     '#[] ##(mainSchema)'
     """  
     