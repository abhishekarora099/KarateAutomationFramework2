Feature: To access the GET end point which is secure with Basic Auth
         GET /secure/webapi/all
         
     Background: Create and Initialize Base Url
          Given url 'http://localhost:9897'
          
     Scenario: To access the GET end point with basic auth
           Given path '/secure/webapi/all'
           And headers {Accept:'application/json', Authorization:'Basic YWRtaW46d2VsY29tZQ=='}
           When method get
           Then status 200
           And match response =='#notnull'
           
     Scenario: To access the GET end point with basic auth via js function
           Given path '/secure/webapi/all'
           * def auth = call read('../../basicAuth1.js') {username:'admin', password:'welcome'}
           And print "This is encoded string ==>", auth
           And headers {Accept:'application/json', Authorization:'#(auth)'}
           When method get
           Then status 200
           And match response =='#notnull'      