Feature: Partner viewing partner's previously submitted forms
  As a partner
  So that I can keep records of my previous client interactions
  I want to view read-only copies of my previously submitted forms.

  Background:
    Given the following partners exist:
      | email           | name  | password      | phone_number | organization | active |
      | cody@cody.com   | Cody  | cody123       | 5103456543   | Kaiser       | true   |
      | daddy@daddy.com | Daddy | daddy123      | 5106554345   | Alta Bates   | true   |

  Scenario: After I login as a partner, I can create a new Client (Intake) Form
    When I go to the "/login" page
    And I fill in "session_email" with "cody@cody.com"
    And I fill in "session_password" with "cody123"
    And I click the "Log in" button
    Then I should see "Partner"

    When I click the "New Client Form" link
    Then I would be at "disclaimer" page
    When I click the "Continue" link
    Then I would be at "Create New Form" page

    And I fill in "form_first_name" with "Will"
    And I fill in "form_middle_initial" with "T"
    And I fill in "form_last_name" with "Smith"
    And I fill in "form_date_of_birth" with "02-05-1985"
    And I fill in "form_phone_number" with "415324564"
    And I select option "English" from "form_preferred_language"
    And I fill in "form_medical_facility" with "San Mateo"
    And I fill in "form_cancer_care_provider" with "Kaiser"
    And I choose "San Mateo County" from radio option
    And I check the checkbox "form_radiation"
    And I choose "Yes" from radio option
    And I check the checkbox "form_additional_info"
    And I check the checkbox "form_consent"
    And I click the "Submit Intake Form" button
    Then I should see "Diplaying Form ID"
    
    When I click the "Continue" link
    Then I should see "confirmation"
    And I should see "You will recieve an email confirming your form submission and your form will be processed within 24 hours"

    When I click the "Back To Dashboard" link
    Then I should see "Smith"

  Scenario: I can view the details of a previously submitted form
    When I go to the "/login" page
    And I fill in "session_email" with "cody@cody.com"
    And I fill in "session_password" with "cody123"
    And I click the "Log in" button
    Then I should see "Partner"

    When I click the "New Client Form" link
    Then I would be at "disclaimer" page
    When I click the "Continue" link
    Then I would be at "Create New Form" page

    And I fill in "form_first_name" with "Will"
    And I fill in "form_middle_initial" with "T"
    And I fill in "form_last_name" with "Smith"
    And I fill in "form_date_of_birth" with "02-05-1985"
    And I fill in "form_phone_number" with "415324564"
    And I select option "English" from "form_preferred_language"
    And I fill in "form_medical_facility" with "San Mateo"
    And I fill in "form_cancer_care_provider" with "Kaiser"
    And I choose "San Mateo County" from radio option
    And I check the checkbox "form_radiation"
    And I choose "Yes" from radio option
    And I check the checkbox "form_additional_info"
    And I check the checkbox "form_consent"
    And I click the "Submit Intake Form" button
    Then I should see "Diplaying Form ID"
    
    When I click the "Continue" link
    Then I should see "confirmation"
    And I should see "You will recieve an email confirming your form submission and your form will be processed within 24 hours"

    When I click the "Back To Dashboard" link
    Then I should see "Smith"
    When I click the "Smith, W" link
    Then I should see "Diplaying Form ID"

