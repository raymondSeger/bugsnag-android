Feature: Reporting Error Context

Scenario: Context automatically set as most recent Activity name
    When I run "AutoContextScenario"
    And I wait for 3 seconds
    Then I should receive a request
    And the request is a valid for the error reporting API
    And the "Bugsnag-API-Key" header equals "a35a2a72bd230ac0aa0f52715bbdc6aa"
    And the exception "message" equals "AutoContextScenario"
    And the event "context" equals "SecondActivity"

Scenario: Context manually set
    When I run "ManualContextScenario"
    Then I should receive a request
    And the request is a valid for the error reporting API
    And the "Bugsnag-API-Key" header equals "a35a2a72bd230ac0aa0f52715bbdc6aa"
    And the exception "message" equals "ManualContextScenario"
    And the event "context" equals "FooContext"

Scenario: Context passed an an argument to notify
    When I run "ArgumentContextScenario"
    Then I should receive a request
    And the request is a valid for the error reporting API
    And the "Bugsnag-API-Key" header equals "a35a2a72bd230ac0aa0f52715bbdc6aa"
    And the exception "errorClass" equals "RuntimeException"
    And the exception "message" equals "deprecated"
    And the event "context" equals "NewContext"
