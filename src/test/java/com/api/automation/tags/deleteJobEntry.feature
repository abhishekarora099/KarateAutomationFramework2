@smoke
Feature: To test the delete end point
     DELETE /normal/webapi/remove{id}

  Background: Create and Initialize base url
    Given url 'http://localhost:9897'

  Scenario: To delete the job entry from application using job id
    * def getRandomValue = function() {return Math.floor((100)*Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntrywithVariables.feature") {_url:'http://localhost:9897', _path:'/normal/webapi/add', _id: '#(createJobId)'}
    Given path '/normal/webapi/remove/' + createJobId
    And headers {Accept:'application/json'}
    When method delete
    Then status 200
    Given path '/normal/webapi/find'
    And params {id:'#(createJobId)', jobTitle:'Software Engg-2'}
    And headers {Accept:'application/json'}
    When method get
    Then status 404

  Scenario: To demo request chaining
    * def getRandomValue = function() {return Math.floor((100)*Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntrywithVariables.feature") {_url:'http://localhost:9897', _path:'/normal/webapi/add', _id: '#(createJobId)'}
    * def jobId = createJob.responseJobId
    * def jobTitle = createJob.responseJobTitle
    * def jobDesc = 'To develop android application and web application'
    Given path '/normal/webapi/update/details'
    And params {id:'#(jobId)', jobTitle:'#(jobTitle)', jobDescription: '#(jobDesc)'}
    And headers {Accept:'application/json'}
    And request {}
    When method patch
    Then status 200
    * def jobId = response.jobId
    * def jobTitle = response.jobTitle
    Given path '/normal/webapi/find'
    And params {id:'#(jobId)', jobTitle:'#(jobTitle)'}
    And headers {Accept:'application/json'}
    When method get
    Then status 200
    And match response.jobDescription == jobDesc
