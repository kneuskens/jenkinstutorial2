Feature: As a user i want an overview of the available pets so that I can sell these to my clients

    Scenario: Test list of return values from Get to /pets
        Given the pets endpoint is up
        When user gets all pets
        Then returned JSON object contains the following data:
      | name  |   status    |
      | dog   |  available  |
      | cat   |  available  |
      | fish  |not available|

    Scenario Outline: Test several pets for availability with Get to /pet
        Given the pets endpoint is up
        When user get <pet>
        Then pet availability should be <availability>

        Examples:
            |pet        |  availability       |
            | dog       |     available       |
            | cat       |     available       |
            | fish      |     not available   |

    Scenario: Test with non existing pet
        Given the pets endpoint is up
        When user get shikorita
        Then pets should return error message