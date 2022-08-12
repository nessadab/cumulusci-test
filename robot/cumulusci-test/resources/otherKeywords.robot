*** Settings ***
Resource        cumulusci/robotframework/Salesforce.robot

*** Keywords ***
Create a test Contact
   [Documentation]  Create a temporary Contact and return it
   
   ## Generate a name to use for Contact
   ${first name}=   Get fake data  first_name
   ${last name}=    Get fake data  last_name

   ## Create a new Contact
   ${contact id}=   Salesforce Insert  Contact
   ...  FirstName=${first name}
   ...  LastName=${last name}

   ## Fetch the Contact object to be returned and save
   ## it to a test variable
   &{new contact}=    Salesforce Get   Contact    ${contact_id}
   Set test variable  &{new contact}