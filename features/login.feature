@tnr @login
Feature: Login

  @valid
  Scenario Outline: Successful login
    Given I open the login page for "<env>"
    When I login with username "<username>" and password "<password>"
    Then I should be redirected to the dashboard

    @integration
    Examples:
      | username              | password     | env  |
      | testeur_integration   | testeur_qa   | env1 |
      | testeur_integration_2 | testeur_qa_2 | env1 |

    @recette
    Examples:
      | username          | password     | env  |
      | testeur_recette   | testeur_qa_3 | env2 |
      | testeur_recette_2 | testeur_qa_4 | env2 |

  @invalid
  Scenario: Failed login with wrong credentials
    Given I open the login page for "<env>"
    When I login with username "<username>" and password "<password>"
    Then I should see an error message

    @integration
    Examples:
      | username                   | password          | env  |
      | testeur_integration_faux   | testeur_qa        | env1 |
      | testeur_integration        | testeur_qa_faux   | env1 |
      | testeur_integration_2_faux | testeur_qa_2      | env1 |
      | testeur_integration_2      | testeur_qa_2_faux | env1 |

    @recette
    Examples:
      | username               | password          | env  |
      | testeur_recette_faux   | testeur_qa_3      | env2 |
      | testeur_recette        | testeur_qa_3_faux | env2 |
      | testeur_recette_2_faux | testeur_qa_4      | env2 |
      | testeur_recette_2      | testeur_qa_4_faux | env2 |
