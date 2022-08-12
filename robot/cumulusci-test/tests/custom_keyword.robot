*** Settings ***
Resource        cumulusci/robotframework/Salesforce.robot
Suite Teardown  Delete session records

*** Test Cases ***
Example of using a custom keyword in a setup step
   [Setup]      Create a test Contact

   ## Get the new Contact that's stored in a test variable,
   ## and add the name to the log
   Log  New Contact: ${new contact}[Name]

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
   &{new contact}=    Salesforce Get    Contact    ${contact_id}
   Set test variable  &{new contact}