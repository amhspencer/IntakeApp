Feature: Admin can deactivate account
	
  As an admin user at BCEF.
  I can deactivate accounts that are no longer in use.

Background:

	#Given that I am logged in as a BCEF admin
	Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         | active |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com | true   |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com | true   |

Scenario: I need to be an admin to deactivate account
	When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  Then I should see myself as an "Admin"

  When I click the "View all users" button
  Then there will be "2" users in "active_users" table

  When I click the button "Deactivated?" with id "1"
  Then there will be "1" users in "active_users" table  
  And there will be "1" users in "inactive_users" table

  When I click the button "Deactivated?" with id "2"
  Then there will be "0" users in "active_users" table  
  And there will be "2" users in "inactive_users" table