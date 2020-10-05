import os  
import time
from selenium import webdriver  
#from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.keys import Keys  
from selenium.webdriver.chrome.options import Options  

chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_driver = os.getcwd() +"\\chromedriver.exe"
driver = webdriver.Chrome(chrome_options=chrome_options, executable_path=chrome_driver)

driver.get("http://192.168.0.1/")
driver.find_element_by_id("userName").clear()
driver.find_element_by_id("userName").send_keys("USERNAME_HERE")
driver.find_element_by_id("pcPassword").clear()
driver.find_element_by_id("pcPassword").send_keys("PASSWORD_HERE")
driver.find_element_by_id("loginBtnText").click()

driver.find_element_by_xpath("//html").click()
#time.sleep(1) 
driver.switch_to.frame('frame1')
driver.find_element_by_xpath("//a[@id='menu_tools']/span").click()
driver.find_element_by_xpath("//a[@id='menu_stat']/span").click()

#driver.switch_to.frame()
driver.switch_to.default_content()
driver.switch_to.frame('frame2')

#SAVE HERE
page = driver.page_source
file_ = open('page.html', 'w')
file_.write(page)
file_.close()

#driver.switch_to.frame()
driver.switch_to.default_content()
driver.switch_to.frame('frame1')
driver.find_element_by_id("menu_logout").click()
obj = driver.switch_to.alert
#time.sleep(1)
obj.accept()

driver.close()

##########

f = open("page.html", "r")
text = f.read()
print (text)
f.close()