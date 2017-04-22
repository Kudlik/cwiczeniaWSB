import unittest
from selenium import webdriver
from time import sleep

class SearchText(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Chrome()

    def test_search_by_text(self):
        driver = self.driverdriver.get("http://www.wsb.pl")
        link = driver.find_element_by_link_text("Studia podyplomowe")
        link.click()
        sleep(5)

    def tearDown(self):
        self.driver.close()
