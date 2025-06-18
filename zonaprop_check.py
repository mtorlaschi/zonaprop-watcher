print("Starting script...")

from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True, slow_mo=500)
    page = browser.new_page()
    page.goto('https://www.zonaprop.com.ar/')
    print(page.title())
    browser.close()


