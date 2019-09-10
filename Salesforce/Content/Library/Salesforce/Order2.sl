namespace: Salesforce
operation:
  name: Order2
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  sequential_action:
    gav: com.microfocus.seq:Salesforce.Order2:1.0.0
    steps:
    - step:
        id: '1'
        object_path: Browser("Login | Salesforce").Page("Login | Salesforce").WebEdit("pw")
        action: SetSecure
        default_args: '"test"'
        snapshot: .\Snapshots\ssf1.html
        highlight_id: '10000000'
    - step:
        id: '2'
        object_path: Browser("Login | Salesforce").Page("Login | Salesforce").WebButton("Log In")
        action: Click
        snapshot: .\Snapshots\ssf2.html
        highlight_id: '10000000'
  results:
  - SUCCESS
  - WARNING
  - FAILURE
