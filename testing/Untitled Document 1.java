// ####################################################################################################

// ✔ Selenium Core
import org.openqa.selenium.*;                    // WebDriver, WebElement, By, Keys, Alert, OutputType, TakesScreenshot, JavascriptExecutor

tors
import org.openqa.selenium.Keys;                 // Keyboard actions
import org.openqa.selenium.Alert;                // Alerts
import org.openqa.selenium.OutputType;           // Screenshots
import org.openqa.selenium.TakesScreenshot;      // Screenshots interface
import org.openqa.selenium.JavascriptExecutor;   // Run JS in browser

// ✔ Selenium actions
import org.openqa.selenium.interactions.Actions; // Mouse + keyboard actions

// ✔ Selenium drivers & options
import org.openqa.selenium.chrome.ChromeDriver;  // Chrome driver
import org.openqa.selenium.chrome.ChromeOptions; // Chrome options/settings

// ✔ WebDriver manager (auto driver binaries)
import io.github.bonigarcia.wdm.WebDriverManager; // Auto-manage drivers

// ✔ TestNG
import org.testng.annotations.Test;              // TestNG test
import org.testng.annotations.BeforeTest;        // Before test block
import org.testng.annotations.AfterTest;         // After test block
import org.testng.annotations.BeforeMethod;      // Before each method
import org.testng.annotations.AfterMethod;       // After each method

// ✔ File handling
import java.io.File;                             // File class
import java.io.IOException;                      // IO exceptions
import org.apache.commons.io.FileUtils;          // Apache commons file utils

// ✔ Time handling
import java.util.concurrent.TimeUnit;            // Time waits

// ✔ Optional: DesiredCapabilities if needed for advanced settings
// import org.openqa.selenium.remote.DesiredCapabilities; 



// ####################################################################################################



✔ DRIVER METHODS — with PARAMETERS

✔ Basic Navigation
driver.get(String url)                        
  // Open URL → driver.get("https://example.com")

driver.getCurrentUrl()                        
  // Returns current URL → String

driver.getTitle()                             
  // Returns page title → String

driver.getPageSource()                        
  // Returns page HTML source → String

driver.close()                                
  // Close current tab/window

driver.quit()                                 
  // Quit browser session (all tabs)
  

✔ Navigation Interface
driver.navigate().to(String url)              
  // Navigate to URL → driver.navigate().to("https://example.com")

driver.navigate().forward()                   
  // Go forward in history

driver.navigate().back()                      
  // Go back in history

driver.navigate().refresh()                   
  // Reload page
  

✔ Window Management
driver.manage().window().maximize()           
  // Maximize window

driver.manage().window().minimize()           
  // Minimize window

driver.manage().window().fullscreen()         
  // Fullscreen mode

driver.manage().window().getSize()            
  // Get window size → Dimension

driver.manage().window().getPosition()        
  // Get window position → Point

driver.manage().window().setPosition(Point p) 
  // Set window position → driver.manage().window().setPosition(new Point(x,y))


✔ Timeouts
driver.manage().timeouts().implicitlyWait(Duration duration) 
  // Set implicit wait → driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10))


✔ Cookies
driver.manage().deleteAllCookies()            
  // Delete all cookies


✔ Window Handles
driver.getWindowHandle()                      
  // Get current window handle → String

driver.getWindowHandles()                     
  // Get all window handles → Set<String>


✔ Switch
driver.switchTo().window(String handle)       
  // Switch to window by handle

driver.switchTo().alert()                     
  // Switch to alert → Alert alert = driver.switchTo().alert()

driver.switchTo().frame(int index)            
  // Switch to frame by index → driver.switchTo().frame(0)

driver.switchTo().frame(String nameOrId)      
  // Switch to frame by name/ID → driver.switchTo().frame("frameName")

driver.switchTo().frame(WebElement frameElement) 
  // Switch to frame by element → driver.switchTo().frame(element)

driver.switchTo().parentFrame()               
  // Switch to parent frame

driver.switchTo().defaultContent()            
  // Switch to top-level page


✔ Find Elements
driver.findElement(By by)                     
  // Find single → driver.findElement(By.id("username"))

driver.findElements(By by)                    
  // Find multiple → List<WebElement> list = driver.findElements(By.tagName("a"))



// ####################################################################################################


✔ WEB ELEMENT METHODS — with PARAMETERS

✔ Basic Info
element.getText()                            
  // Get visible text → String

element.getTagName()                         
  // Get tag name (e.g., input, div) → String

element.getAttribute(String name)            
  // Get attribute value → element.getAttribute("value")

element.getCssValue(String propertyName)     
  // Get CSS property → element.getCssValue("color")


✔ Actions
element.click()                              
  // Click element

element.submit()                             
  // Submit form

element.sendKeys(CharSequence... keysToSend) 
  // Type input → element.sendKeys("text")

element.clear()                              
  // Clear input field


✔ State
element.isDisplayed()                        
  // Is visible → boolean

element.isEnabled()                          
  // Is enabled → boolean

element.isSelected()                         
  // Is selected (checkbox/radio) → boolean


✔ Location & Size
element.getLocation()                        
  // Get point → Point (x,y)

element.getLocation().getX()                 
  // Get X → int

element.getLocation().getY()                 
  // Get Y → int

element.getSize()                            
  // Get size → Dimension (width,height)

element.getSize().getHeight()                
  // Get height → int

element.getSize().getWidth()                 
  // Get width → int

element.getRect()                            
  // Get full rect → Rectangle (x,y,w,h)

element.getRect().getX()                     
  // Rect X

element.getRect().getY()                     
  // Rect Y

element.getRect().getWidth()                 
  // Rect width

element.getRect().getHeight()                
  // Rect height


✔ Accessibility
element.getAccessibleName()                  
  // ARIA accessible name → String

element.getAriaRole()                        
  // ARIA role → String



// ####################################################################################################
