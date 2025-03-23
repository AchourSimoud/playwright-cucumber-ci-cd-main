@post
Feature: Post

  @valid
  Scenario Outline: Create post button
    Given I open the login page for "<env>"
    When I login with username "<username>" and password "<password>"
    Then I should be redirected to the dashboard
    Given Je suis sur le dashboard
    And je clique sur le bouton add post
    Then je suis redirige vers la page de creation de post
    And je creer un post avec "<title>" et "<content>" et je clique sur le bouton save
    Then je vois mon super post dans la liste des posts

    @integration
    Examples:
      | env  | username              | password     | title     | content                |
      | env1 | testeur_integration   | testeur_qa   | mon titre | le contenu de mon post |
      | env1 | testeur_integration_2 | testeur_qa_2 | mon titre | le contenu de mon post |

    @recette
    Examples:
      | env  | username          | password     | title     | content                |
      | env2 | testeur_recette   | testeur_qa_3 | mon titre | le contenu de mon post |
      | env2 | testeur_recette_2 | testeur_qa_4 | mon titre | le contenu de mon post |

  @invalid
  Scenario Outline: Create post button
    Given I open the login page for "<env>"
    When I login with username "<username>" and password "<password>"
    Then I should be redirected to the dashboard
    Given Je suis sur le dashboard
    And je clique sur le bouton add post
    Then je suis redirige vers la page de creation de post
    And je creer un post avec "<title>" et "<content>" et je clique sur le bouton save
    Then un message derreur saffiche

    @integration
    Examples:
      | env  | username              | password     | title     | content                |
      | env1 | testeur_integration   | testeur_qa   | mon titre |                        |
      | env1 | testeur_integration   | testeur_qa   |           | le contenu de mon post |
      | env1 | testeur_integration_2 | testeur_qa_2 | mon titre |                        |
      | env1 | testeur_integration_2 | testeur_qa_2 |           | le contenu de mon post |

    @recette
    Examples:
      | env  | username          | password     | title     | content                |
      | env2 | testeur_recette   | testeur_qa_3 | mon titre |                        |
      | env2 | testeur_recette   | testeur_qa_3 |           | le contenu de mon post |
      | env2 | testeur_recette_2 | testeur_qa_4 | mon titre |                        |
      | env2 | testeur_recette_2 | testeur_qa_4 |           | le contenu de mon post |
