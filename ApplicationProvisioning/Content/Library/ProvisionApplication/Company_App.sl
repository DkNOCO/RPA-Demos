namespace: ProvisionApplication
flow:
  name: Company_App
  inputs:
    - fqdn: web-dev.dca.demo.local
    - db_host: localhost
    - app_server_user: root
    - app_server_password:
        default: Automation123
        sensitive: true
    - db_user: admin
    - db_pass:
        default: Automation123
        sensitive: true
    - db_name: POC_APP_POOL
  workflow:
    - check_server_exists:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${fqdn}'
            - command: ls
            - username: '${app_server_user}'
            - password:
                value: '${app_server_password}'
                sensitive: true
        navigate:
          - SUCCESS: provision_web_server_middleware
          - FAILURE: deploy_instance
    - deploy_instance:
        do:
          io.cloudslang.amazon.aws.ec2.deploy_instance:
            - identity: '123'
            - credential:
                value: '123'
                sensitive: true
            - image_id: '123'
        navigate:
          - SUCCESS: check_server_ready
          - FAILURE: on_failure
    - provision_web_server_middleware:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${fqdn}'
            - command: yum -y install httpd php
            - username: '${app_server_user}'
            - password:
                value: '${app_server_password}'
                sensitive: true
        navigate:
          - SUCCESS: provision_database
          - FAILURE: on_failure
    - provision_database:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${fqdn}'
            - command: yum -y install mysql
            - username: '${app_server_user}'
            - password:
                value: '${app_server_password}'
                sensitive: true
        navigate:
          - SUCCESS: provision_application
          - FAILURE: on_failure
    - check_server_ready:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${fqdn}'
            - command: ls
            - username: '${app_server_user}'
            - password:
                value: '${app_server_password}'
                sensitive: true
        navigate:
          - SUCCESS: check_server_exists
          - FAILURE: on_failure
    - provision_application:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${fqdn}'
            - command: 'cd /var/www/html && git fetch --all && git reset --hard'
            - username: '${app_server_user}'
            - password:
                value: '${app_server_password}'
                sensitive: true
        navigate:
          - SUCCESS: start_web_server
          - FAILURE: on_failure
    - start_web_server:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${fqdn}'
            - command: 'service httpd start && cp /appconfig/config.php /var/www/html/config.php'
            - username: '${app_server_user}'
            - password:
                value: '${app_server_password}'
                sensitive: true
        navigate:
          - SUCCESS: configure_application
          - FAILURE: on_failure
    - configure_application:
        do:
          ProvisionApplication.configure_application:
            - fqdn: '${fqdn}'
            - db_name: '${db_name}'
            - db_user: '${db_user}'
            - db_pass: '${db_pass}'
            - db_host: '${db_host}'
        navigate:
          - SUCCESS: smoke_test
          - WARNING: smoke_test
          - FAILURE: on_failure
    - smoke_test:
        do:
          ProvisionApplication.smoke_test: []
        navigate:
          - SUCCESS: string_equals
          - WARNING: string_equals
          - FAILURE: on_failure
    - string_equals:
        do:
          io.cloudslang.base.strings.string_equals: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      check_server_exists:
        x: 63
        'y': 92
      smoke_test:
        x: 744
        'y': 409
      provision_database:
        x: 431
        'y': 101
      provision_application:
        x: 591
        'y': 103
      start_web_server:
        x: 742
        'y': 106
      deploy_instance:
        x: 60
        'y': 305
      string_equals:
        x: 560
        'y': 454
        navigate:
          b8f90e7f-970f-a3c7-3561-5c19eaeff26f:
            targetId: 913390da-0b50-dc85-6510-db7ede7dc3e6
            port: SUCCESS
      configure_application:
        x: 861
        'y': 236
      provision_web_server_middleware:
        x: 250
        'y': 96
      check_server_ready:
        x: 261
        'y': 302
    results:
      SUCCESS:
        913390da-0b50-dc85-6510-db7ede7dc3e6:
          x: 296
          'y': 475
