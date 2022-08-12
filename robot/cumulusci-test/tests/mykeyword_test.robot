*** Settings ***
Resource        cumulusci/robotframework/Salesforce.robot
Resource        robot/cumulusci-test/resources/otherKeywords.robot

Documentation   My first robot test by Vanessa

Suite Teardown  Delete session records


*** Test Cases ***
Create Contacts with below names
   Create other contacts        Bia      Lunes
   Create other contacts        Tia      Martes
   Create other contacts        Pia      Miercoles
   Create other contacts        Kia      Sabado

   [Teardown]       Delete session records
