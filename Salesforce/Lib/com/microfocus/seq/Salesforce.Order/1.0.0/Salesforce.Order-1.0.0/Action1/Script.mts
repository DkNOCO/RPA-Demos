Browser("Login | Salesforce").Page("Login | Salesforce").WebEdit("username").Set "petr.panuska-cszm@force.com" @@ hightlight id_;_10000000_;_script infofile_;_ssf1.xml_;_
Browser("Login | Salesforce").Page("Login | Salesforce").WebEdit("pw").SetSecure "5d2e4352381e31c4715fde6d963f579184638d597ce8dada99909dd2d2ba" @@ hightlight id_;_10000000_;_script infofile_;_ssf2.xml_;_
Browser("Login | Salesforce").Page("Login | Salesforce").WebButton("Log In").Click @@ hightlight id_;_10000000_;_script infofile_;_ssf3.xml_;_
Browser("Login | Salesforce").Page("Salesforce - Professional").Link("Orders").Click @@ hightlight id_;_10000000_;_script infofile_;_ssf4.xml_;_
Browser("Login | Salesforce").Page("Orders: Home ~ Salesforce").WebButton("New").Click @@ hightlight id_;_10000000_;_script infofile_;_ssf5.xml_;_
Browser("Login | Salesforce").Page("New Order ~ Salesforce").Image("Customer Authorized By").FireEvent "onmouseover" @@ hightlight id_;_10000000_;_script infofile_;_ssf6.xml_;_
Browser("Login | Salesforce").Page("New Order ~ Salesforce").WebEdit("accid").Set "Delta" @@ hightlight id_;_10000000_;_script infofile_;_ssf7.xml_;_
Browser("Login | Salesforce").Page("New Order ~ Salesforce").Image("Customer Authorized By").FireEvent "onmouseover" @@ hightlight id_;_10000000_;_script infofile_;_ssf8.xml_;_
Browser("Login | Salesforce").Page("New Order ~ Salesforce").WebEdit("Contract").Set "00000101" @@ hightlight id_;_10000000_;_script infofile_;_ssf9.xml_;_
Browser("Login | Salesforce").Page("New Order ~ Salesforce").WebEdit("EffectiveDate").Set "16/7/2019" @@ hightlight id_;_10000000_;_script infofile_;_ssf10.xml_;_
Browser("Login | Salesforce").Page("New Order ~ Salesforce").WebEdit("Description").Set "Ordering for Delta" @@ hightlight id_;_10000000_;_script infofile_;_ssf11.xml_;_
Browser("Login | Salesforce").Page("New Order ~ Salesforce").WebButton("Save").Click @@ hightlight id_;_10000000_;_script infofile_;_ssf12.xml_;_
Browser("Login | Salesforce").Page("Order 00000132 ~ Salesforce").WebElement("Order 00000132").Click @@ hightlight id_;_10000000_;_script infofile_;_ssf13.xml_;_
Browser("Login | Salesforce").Page("Order 00000132 ~ Salesforce").WebElement("Order 00000132").Output CheckPoint("order_number")
Browser("Login | Salesforce").Page("Order 00000132 ~ Salesforce").WebElement("Order 00000132").Click @@ hightlight id_;_10000000_;_script infofile_;_ssf14.xml_;_
Browser("Login | Salesforce").Page("Order 00000132 ~ Salesforce").WebElement("Order 00000132").Click @@ hightlight id_;_10000000_;_script infofile_;_ssf15.xml_;_
