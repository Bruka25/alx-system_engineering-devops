The following scripts are for ALX 0x1A-application_server project for the alx-system_engineering-devops curriculum, inside it contains the following python files and bash scripts:

* First task requirements:

     -> Make sure that task #3 of your SSH project is completed for web-01. The checker will connect to your servers.
     -> Install the net-tools package on your server: sudo apt install -y net-tools
     -> Git clone your AirBnB_clone_v2 on your web-01 server.
     -> Configure the file web_flask/0-hello_route.py to serve its content from the route /airbnb-onepage/ on port 5000.
     -> Your Flask application object must be named app (This will allow us to run and check your code).

* Second task requirements:

     -> Install Gunicorn and any other libraries required by your application.
     -> The Flask application object should be called app. (This will allow us to run and check your code)
     -> You will serve the same content from the same route as in the previous task. You can verify that it’s working by        binding a Gunicorn instance to localhost listening on port 5000 with your application object as the entry point.
     -> In order to check your code, the checker will bind a Gunicorn instance to port 6000, so make sure nothing is 
        listening on that port.

* Third task requirements:

     -> Nginx must serve this page both locally and on its public IP on port 80.
     -> Nginx should proxy requests to the process listening on port 5000.
     -> Include your Nginx config file as 2-app_server-nginx_config

* Fourth task requirements:

     -> Nginx must serve this page both locally and on its public IP on port 80.
     -> Nginx should proxy requests to the route /airbnb-dynamic/number_odd_or_even/(any integer) the process listening         on port 5001.
     -> Include your Nginx config file as 3-app_server-nginx_config.

* Fifth task requirements:

     -> Git clone your AirBnB_clone_v3
     -> Setup Nginx so that the route /api/ points to a Gunicorn instance listening on port 5002
     -> Nginx must serve this page both locally and on its public IP on port 80
     -> To test your setup you should bind Gunicorn to api/v1/app.py
     -> It may be helpful to import your data (and environment variables) from this project
     -> Upload your Nginx config file as 4-app_server-nginx_config

* Sixth task requirements:

     -> Git clone your AirBnB_clone_v4
     -> Your Gunicorn instance should serve content from web_dynamic/2-hbnb.py on port 5003
     -> Setup Nginx so that the route / points to your Gunicorn instance
     -> Setup Nginx so that it properly serves the static assets found in web_dynamic/static/ 
        (this is essential for your page to render properly)
     -> For your website to be fully functional, you will need to reconfigure web_dynamic/static/scripts/2-hbnb.js 
        to the correct IP
     -> Nginx must serve this page both locally and on its public IP and port 5003
     -> Make sure to pull up your Developer Tools on your favorite browser to verify that you have no errors
     -> Upload your Nginx config as 5-app_server-nginx_config

* Seventh task requirements:

     -> Write a systemd script which starts a Gunicorn process to serve the same content as the previous task (
        web_dynamic/2-hbnb.py)
     -> The Gunicorn process should spawn 3 worker processes
     -> The process should log errors in /tmp/airbnb-error.log
     -> The process should log access in /tmp/airbnb-access.log
     -> The process should be bound to port 5003
     -> Your systemd script should be stored in the appropriate directory on web-01
     -> Make sure that you start the systemd service and leave it running
     -> Upload gunicorn.service to GitHub

* A simple Bash script to reload Gunicorn in a graceful way















































