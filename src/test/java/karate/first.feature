Feature: Check get request
Background: test
* def load = read("payload.json")
* url 'https://reqres.in/api/'
* def fea = read ('login.feature')
* def resultLogin = callonce fea
#* def resultLogin = call fea


@smoke
Scenario: chk get request and verify status
Given url "https://reqres.in/api/users?page=2"
When method GET
Then status 200
# Then print 'the response is :',response
Then print 'last name is :',response.data[0].last_name
* def expOutput = read('result.json')
And match response == expOutput   
Then print expOutput.data[1].id
And match response.data[0].id == 7
And assert responseStatus == 200
And match response contains {"per_page": 6}
And match response.data[*].last_name contains "Lawson"
And match response.data[*].id contains [7,8,9]
* def r = karate.sizeOf(response.data)
Then print 'size of array :',r

Scenario: chk get request and verify status second
Given url "https://reqres.in/api/users?page=2"
When method GET
Then status 200
# Then print 'the response is :',response
Then print 'last name is :',response.data[0].last_name
 
Scenario: chk post request
Given url "https://reqres.in/api/users"
And request '{"name": "morpheussss","job": "leader"}'
Then method POST
Then status 201 
Then print 'Post method cpmlt'


Scenario: post request from ext file
Given url "https://reqres.in/api/users"
And request load
Then method POST
Then status 201 
# And header Content-Type = 'application/json'
And headers {charset: 'utf-8', Content-Type: 'application/json'}
Then print 'reading post data from ext json file'


Scenario Outline: chk post request
Given url "https://reqres.in/api/users"
And request '{"name":<name>,"job":<job>}'
Then method POST
Then status 201
Then print 'Scenario outline test case'
Examples:
|name|job|
|raja|new job|

Scenario Outline: chk post request with CSV file
Given path 'users'
And request '{"name":<name>,"job":<job>}'
Then method POST
Then status 201
Then print 'Scenario outline test case with csv file'
Then print response
Examples:
|read('test.csv')|


Scenario: read js function
* def myFun =
"""	
function(){
return 'my name is '
}
"""
* def data = call myFun
Then print 'data from js function', data

@rt
Scenario: read js function with parameter
* def myFun1 =
"""	
function(arg){
return 'my name is ',arg
}
"""
* def data1 = call myFun1 'raja'

Then print 'data from js function with parametet', data1

Scenario: call non staic function from java class
* def JavaDemo = Java.type('karate.TestMethodClass')
* def res = new JavaDemo().nonStaticMethod();
Then print res


Scenario: call  staic function from java class
* def JavaDemo = Java.type('karate.TestMethodClass')
* def res = JavaDemo.staticMethod();
Then print res

Scenario: call non staic function from java class with args
* def JavaDemo = Java.type('karate.TestMethodClass')
* def res = new JavaDemo().nonStaticMethodWithArgs("with_args");
Then print res

Scenario: call  staic function from java class with args
* def JavaDemo = Java.type('karate.TestMethodClass')
* def res = JavaDemo.staticMethodWithArgs("with_args");
Then print res
Then print 'Name is :',name
Then print 'profile is :',profile 

Scenario: chk get request and verify status URL from js file
Given url url
When method GET
Then status 200
Then print 'url from js file'
#Then print resultLogin

@smoke
Scenario: chk get request and verify status using tags
Given url "https://reqres.in/api/users?page=2"
When method GET
Then status 200

@rt @smoke
Scenario: call  staic function from java class
* def JavaDemo = Java.type('test.Message')
* def res = JavaDemo.m();
Then print res
