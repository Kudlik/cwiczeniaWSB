*** Settings ***
Library  Selenium2Library

*** Variables ***

${loginwp}  testerwsb_t1
${passwordwp}  adam1234

*** Test Cases ***
logowanie na pocztę wp
  Open Browser  ${EMPTY}  ff
  Go to  https://www.wp.pl
  Click element  xpath=.//*[@id='header']/header/div[1]/div/ul/li[1]/a
  Input Text  id=login  ${loginwp}
  Input Text  id=password  ${passwordwp}\n
  Sleep  5
  Click element  xpath=.//*[@id='bxPanelTopBody']/div/div[1]/a[2]
  Sleep  10
  Input Text  textarea class=textareaInput wideInput  testerwsb_t1@wp.pl
