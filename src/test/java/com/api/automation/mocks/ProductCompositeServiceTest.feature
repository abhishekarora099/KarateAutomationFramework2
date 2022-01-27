Feature: To test the Get Endpoint of Product Composite Service
   
   Scenario: To test the Get endpoint by mocking downstream service
        Given url 'http://localhost:9090'
        And path 'productinfo/123'
        And header Accept = 'application/json'
        When method get
        Then status 200
        And match response.companyName =='Amazon.com'
        And match response.product =='#notnull'
        And match response.review =='#notnull'
        