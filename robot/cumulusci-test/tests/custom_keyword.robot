*** Settings ***
Resource        cumulusci/robotframework/Salesforce.robot
Resource        robot/cumulusci-test/resources/otherKeywords.robot

Suite Teardown  Delete session records

*** Test Cases ***
Example of using a custom keyword in a setup step
   [Setup]      Create a test Contact

   ## Get the new Contact that's stored in a test variable,
   ## and add the name to the log
   Log  New Contact: ${new contact}[Name]