Feature: Partner can only create new form, cannot execute any function of admin.
	
  As a partner
  I can only view my partner's dashboard
  If I try to visit the admin's route or execute admin's function
  I will be redirected to "Not an admin" page

Background:

  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         | admin |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com | t     |

  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         | admin |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com | f     |

Scenario: As a partner, i can view my dashboard.
  When I go to the "/login" page
  And I fill in "session_email" with "bobby@bobby.com"
  And I fill in "session_password" with "bobby123"
  And I click the "Log in" button
  Then I should see "Bobby"
  And I should see "User dashboard"

Scenario: As a partner, i cannot go to admin's routes.
  When I go to the "/login" page
  And I fill in "session_email" with "bobby@bobby.com"
  And I fill in "session_password" with "bobby123"
  And I click the "Log in" button
  And I go to the "/admins/1" page
  Then I should see "Not an admin"