Feature: Browse poems
  In order to keep track of the awesome poems
  As a guest
  I want to be able to browse poems

  Background:
    Given I am logged in

  Scenario: Browsing the poems page
    Given a poem exists with the title 'My Cool Poem'
    When I visit the poems index page
    Then I should see "My Cool Poem"
    # And show me the page
