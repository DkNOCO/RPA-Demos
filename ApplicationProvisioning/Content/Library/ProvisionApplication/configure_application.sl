namespace: ProvisionApplication
operation:
  name: configure_application
  inputs:
    - fqdn
    - db_name
    - db_user
    - db_pass
    - db_host
  sequential_action:
    gav: 'com.microfocus.seq:ProvisionApplication.configure_application:1.0.0'
    steps:
      - step:
          id: '1'
          object_path: 'Browser("Application Setup").Page("Application Setup").WebEdit("app_domain_name")'
          action: Set
          default_args: '"web-dev.dca.demo.local"'
          snapshot: ".\\Snapshots\\ssf1.html"
          highlight_id: '10000000'
          args: 'Parameter("fqdn")'
      - step:
          id: '2'
          object_path: 'Browser("Application Setup").Page("Application Setup").WebEdit("db_host_name")'
          action: Set
          default_args: '"test"'
          snapshot: ".\\Snapshots\\ssf2.html"
          highlight_id: '10000000'
          args: 'Parameter("db_host")'
      - step:
          id: '3'
          object_path: 'Browser("Application Setup").Page("Application Setup").WebEdit("db_name")'
          action: Set
          default_args: '"test"'
          snapshot: ".\\Snapshots\\ssf3.html"
          highlight_id: '10000000'
          args: 'Parameter("db_name")'
      - step:
          id: '4'
          object_path: 'Browser("Application Setup").Page("Application Setup").WebEdit("db_user")'
          action: Set
          default_args: '"test"'
          snapshot: ".\\Snapshots\\ssf4.html"
          highlight_id: '10000000'
          args: 'Parameter("db_user")'
      - step:
          id: '6'
          object_path: 'Browser("Application Setup").Page("Application Setup").WebEdit("db_user_pass")'
          action: SetSecure
          default_args: '"test"'
          snapshot: ".\\Snapshots\\ssf6.html"
          highlight_id: '10000000'
          args: 'Parameter("db_pass")'
      - step:
          id: '8'
          object_path: 'Browser("Application Setup").Page("Application Setup").WebButton("Save")'
          action: Click
          snapshot: ".\\Snapshots\\ssf8.html"
          highlight_id: '10000000'
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
