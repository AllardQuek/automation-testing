from selenium import webdriver
from selenium.webdriver.chrome.options import Options


chr_options = Options()
chr_options.add_experimental_option("detach", True)
driver = webdriver.Chrome(options=chr_options)
driver.get("http://www.python.org")
assert "Python" in driver.title
# driver.close()