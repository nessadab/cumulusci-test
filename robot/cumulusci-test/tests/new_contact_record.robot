*** Settings ***
Resource        cumulusci/robotframework/Salesforce.robot
Documentation   A simple Robot test
Suite Teardown  Delete session records

*** Test Cases ***
Create a Contact with a generated name
   [Teardown]       Delete session records

   ## Generate a name to use for Contact
   ${first name}=   Get fake data  first_name
   ${last name}=    Get fake data  last_name

   ## Create a new Contact
   ${contact id}=   Salesforce Insert  Contact
   ...  FirstName=${first name}
   ...  LastName=${last name}

   ## Get the new Contact and add name to the log
   &{contact}=      Salesforce Get  Contact  ${contact id}
   Log  Contact name: ${contact}[Name]