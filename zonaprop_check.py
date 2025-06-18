print("Starting script...")

from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)
    
    # Use a common desktop user-agent
    context = browser.new_context(user_agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36")
    page = context.new_page()

    # Go to the site and wait for Cloudflare to clear
    page.goto('https://www.zonaprop.com.ar/', timeout=60000)
    page.wait_for_timeout(5000)  # Wait 5 seconds

    # Print title to confirm real page loaded
    print("Page title:", page.title())

    browser.close()


