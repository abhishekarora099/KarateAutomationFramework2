Feature: To test the GET end point with Query Parameter
         GET /normal/webapi/find
         
     Background: Create and Initialize base url
           Given url 'http://localhost:9897'
           
     Scenario: To get the data using Query Parameter
          * def getRandomValue = function() {return Math.floor((100)*Math.random());}
          * def createJobId = getRandomValue()
           * def postRequest = call read("../../createJobEntrywithVariables.feature") {_url:'http://localhost:9897', _path:'/normal/webapi/add', _id: '#(createJobId)'}
           Given path '/normal/webapi/find'
           And params {id:'#(createJobId)', jobTitle:'Software Engg-2'}
           When method get
           Then status 200
           And match response.jobId == createJobId
           
           