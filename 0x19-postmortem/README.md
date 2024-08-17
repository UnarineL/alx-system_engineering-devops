# Postmortem Report: Apache 500 Internal Server Error

## Issue Summary

Duration: August 16,2024, 08:00 - Augist 16, 2024, 12:00 GMT

Impact: The Apache web server was returning a '500 Internal Server Error',
	affecting 100% of users accessing the web application.
 
Root Cause: A typo in the wordpress configuration file ('wp-settings.php') was
	causing a fatal error in PHP, resulting in Apache returning a '500 internal 	server Error'.

## Timeline

08:00: Issue detected by a routine check on the web application, returning a '500 	Internal Servor Error'.

08:05: Issue detected began with a focus on server logs and Apache error logs.

08:10: Investigation began with a focus on server logs and Apche error logs.

08:20: Initial assumption was a server misconfiguration or hardware issue.

08:30: Narrowed down investigation to application code; found no recent changes in 	apache configuration.

08:45: Discovered the issue was due to a typo in the 'wp-settings.php' file ('phpp'	instead of 'php').

09:00: Applied a fix using a 'sed' command to replace 'phpp' with 'php'.

09:15: restarted Apache to apply the fix.

09:30: Verified the application was back online and functional by perfoming tests.

12:00: Issue confirmed resolved; no further incidents reported.

## Root Cause and Resolution

Root Cause: A typo in the wordpress configuration file ('wp-settings.php') led to a 	php error Apche to return a '500 Internal Server Error'. The error was due to 	incorrect reference to 'phpp', which was not recognized by php.
Resolution: the typo was corrected using a 'sed' command to replace 'phpp' woth 'php'. Apache was then resterted to ensure the changed took effect. This resolved the issue and the web application was restored to naorma operation.

## Improvements

~implement strciter code to review practices to catch typos and erros inconfigarion files before they are deployed.
~Enhance monitoring and alerting to detect application-level errors more quickly.

## Tasks

~Review and update configuration file templates to ensure correct syntax.
~Add automated tests for configuration files to detect issues before deployment
~imprvoe logging and monitorig to provide more detailed insights into application errors
~Conduct a postmortem review for any future incidents to identify and address potential weakness in the system.
