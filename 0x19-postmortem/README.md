Postmortem: Resolving Service Outage on April 10th, 2024

By Biruk Assefa

Issue Summary:

Duration: The outage occurred from 10:00 AM to 1:00 PM on April 10th, 2024 (UTC).

Impact: The outage affected the availability of our primary web service, causing it to be inaccessible for approximately 30% of our users. Users experienced slow response times and intermittent errors during this period.

Root Cause: The root cause of the outage was identified as a database connection pool exhaustion due to a sudden surge in traffic caused by a misconfigured caching layer.

Timeline:

10:00 AM: The issue was detected through monitoring alerts indicating a spike in database connection errors.
10:05 AM: Engineers began investigating the issue, initially assuming it to be a database performance problem.
10:30 AM: Further investigation revealed the misconfigured caching layer as the likely culprit, leading to a redirection of focus.
11:00 AM: The incident was escalated to the database and infrastructure teams for additional support.
12:00 PM: With collaborative effort, the root cause was confirmed, and corrective measures were devised.
1:00 PM: The issue was resolved by reconfiguring the caching layer and optimizing the database connection pool settings.
Root Cause and Resolution:

Root Cause: The misconfigured caching layer led to an unexpected increase in database queries, overwhelming the connection pool and causing service degradation.

Resolution: The caching layer configuration was adjusted to distribute traffic more evenly, and database connection pool settings were optimized to handle peak loads more effectively.

Corrective and Preventative Measures:

Improvements/Fixes: Enhance monitoring of database connection metrics to detect anomalies earlier, conduct regular audits of system configurations to prevent similar misconfigurations, and implement automated scaling mechanisms to handle sudden traffic spikes.
Tasks to Address the Issue:
Implement stricter caching policies to prevent overloading the database.
Update documentation to ensure accurate configuration procedures for future reference.
Enhance alerting thresholds for early detection of similar issues.
