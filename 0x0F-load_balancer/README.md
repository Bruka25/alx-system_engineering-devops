The following bash scripts are for ALX 0x0F-load_balancer project, inside it contains the following bash scripts:

* Configure custom HTTP response header:

       -> The name of the custom HTTP header must be X-Served-By
       -> The value of the custom HTTP header must be the hostname of the server Nginx is running on
* Install and configure HAproxy on the lb-01 server:

       -> Configure HAproxy so that it send traffic to web-01 and web-02
       -> Distribute requests using a roundrobin algorithm
       -> Make sure that HAproxy can be managed via an init script
       -> Make sure that your servers are configured with the right hostnames: [STUDENT_ID]-web-01 and [STUDENT_ID]-web-02 
* Just as the first task, we’d like you to automate the task of creating a custom HTTP header response, but with Puppet:

       -> The name of the custom HTTP header must be X-Served-By
       -> The value of the custom HTTP header must be the hostname of the server Nginx is running on
