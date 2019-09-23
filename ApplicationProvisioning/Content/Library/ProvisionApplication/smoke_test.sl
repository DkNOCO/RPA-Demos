namespace: ProvisionApplication
operation:
  name: smoke_test
  outputs:
  - Title_Banner:
      robot: true
      value: ${Title_Banner}
  - return_result: ${return_result}
  - error_message: ${error_message}
  sequential_action:
    gav: com.microfocus.seq:ProvisionApplication.smoke_test:1.0.0
    steps:
    - step:
        id: '1'
        object_path: Browser("My Company Application").Page("My Company Application").Link("List Resources")
        action: Click
        snapshot: .\Snapshots\ssf1.html
        highlight_id: '10000000'
    - step:
        id: '2'
        object_path: Browser("My Company Application").Page("My Company Application_2").Link("View")
        action: Click
        snapshot: .\Snapshots\ssf2.html
        highlight_id: '10000000'
    - step:
        id: '3'
        object_path: Browser("My Company Application").Page("My Company Application_2").WebElement("My Company Application")
        action: Click
        snapshot: .\Snapshots\ssf3.html
        highlight_id: '10000000'
    - step:
        id: '4'
        object_path: Browser("My Company Application").Page("My Company Application_2").WebElement("My Company Application")
        action: Output
        default_args: CheckPoint("Title_Banner")
  results:
  - SUCCESS
  - WARNING
  - FAILURE
