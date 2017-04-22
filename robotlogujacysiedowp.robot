*** Settings ***

Library  Selenium2Library
Variables  danetestowe.py

*** Variables ***

${danetestowe.USER}
${danetestowe.PSWD}
${danetestowe.RECIPIENT}
${danetestowe.TITLE}
${danetestowe.CONTENT}

*** Test Cases ***

logowanie na poczte
  dane do logowania  ${USER}  ${PSWD}

wyslanie wiadomosci
  dane do wysylki  ${RECIPIENT}  ${TITLE}  ${CONTENT}

koniec
  close browser

*** Keywords ***

dane do logowania
  [ARGUMENTS]  ${nazwa_maila}  ${haslo}
  Open Browser  ${EMPTY}  ff
  Go to  https://www.gmail.com
  Click element  id=Email
  Input Text  id=Email  ${nazwa_maila}
  Click element  id=next
  Wait until element is enabled  id=Passwd
  Click element  id=Passwd
  Input Text  id=Passwd  ${haslo}
  Click element  id=signIn
  Wait until element is enabled  xpath=//div[7]/div[3]/div/div[2]/div[1]/div[1]/div[1]/div[2]/div/div/div[1]/div/div

dane do wysylki
  [ARGUMENTS]  ${odbiorca}  ${tytul}  ${tresc}
  Click element  xpath=//div[7]/div[3]/div/div[2]/div[1]/div[1]/div[1]/div[2]/div/div/div[1]/div/div
  Input Text  name=to  ${odbiorca}
  Click element  name=subjectbox
  Input Text  name=subjectbox  ${tytul}
  Click element  xpath=//div[13]/div/div/div/div[1]/div[3]/div[1]/div[1]/div/div/div/div[3]/div/div/div[4]/table/tbody/tr/td[2]/table/tbody/tr[1]/td/div/div[1]/div[2]/div[1]/div/table/tbody/tr/td[2]/div[2]/div
  Input Text  xpath=//div[13]/div/div/div/div[1]/div[3]/div[1]/div[1]/div/div/div/div[3]/div/div/div[4]/table/tbody/tr/td[2]/table/tbody/tr[1]/td/div/div[1]/div[2]/div[1]/div/table/tbody/tr/td[2]/div[2]/div  ${tresc}
  Sleep  2
  Click element  xpath=//div[13]/div/div/div/div[1]/div[3]/div[1]/div[1]/div/div/div/div[3]/div/div/div[4]/table/tbody/tr/td[2]/table/tbody/tr[2]/td/div/div/div[4]/table/tbody/tr/td[1]/div/div[2]
  Sleep  2
  capture page screenshot  filename=selenium-screenshot-send.png
