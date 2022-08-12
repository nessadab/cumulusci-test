*** Settings ***
Resource        cumulusci/robotframework/Salesforce.robot
Documentation   My first robot test by Vanessa
Suite Teardown  Delete session records


*** Test Cases ***
Create Contacts with below names
   Create a test Contact        Lili      Mali
   Create a test Contact        Bibi      Fifi
   Create a test Contact        Gigi      Hadid
   Create a test Contact        Mimi      Bakery


*** Keywords ***
Create a test Contact
   [Arguments]    ${first name}       ${last name}    
   [Documentation]  Create a temporary Contact and return it

   ## Create a new Contact
   ${contact id}=   Salesforce Insert  Contact
   ...  FirstName=${first name}
   ...  LastName=${last name}

   ## Fetch the Contact object to be returned and save
   ## it to a test variable
   &{new contact}=    Salesforce Get    Contact    ${contact_id}
   Set test variable  &{new contact}