Feature: Admin can view admin's dashboard and partner's dashboard.
	
  As an admin
  I can only view my admin's dashboard
  And I can also view other partners' dashboards.

Background:

  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         | admin |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com | t     |

  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         | admin |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com | f     |

Scenario: As an admin, i can view my dashboard.
  When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  Then I should see "Andy"
  And I should see "Admin"

Scenario: As an admin, i can view other partners' dashboards.
  When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  And I go to the "/partners/1" page
  Then I should see "User dashboard"