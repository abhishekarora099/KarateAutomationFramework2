Feature: To test the patch end point for updating the job description

    Background: Create and Initialize base url
        Given url 'http://localhost:9897'
        
    Scenario: To update the job description for newly added job Entry
          * def getRandomValue = function() {return Math.floor((100)*Math.random());}
          * def createJobId = getRandomValue()
          * def createJob = call read("../createJobEntrywithVariables.feature") {_url:'http://localhost:9897', _path:'/normal/webapi/add', _id: '#(createJobId)'}
          * def jobDesc = 'To develop android application and web application'
          Given path '/normal/webapi/update/details'
          And params {id:'#(createJobId)', jobTitle:'Software Engg-2', jobDescription: '#(jobDesc)'}
          And header Accept = 'application/json'
          When method patch 
          Then status 200
          And match response.jobDescription == jobDesc
          
          