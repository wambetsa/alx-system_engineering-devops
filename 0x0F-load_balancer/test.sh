frontend www
    bind :80
    acl images_url path_beg -i /images/
    use_backend static_assets if images_url

backend static_assets
    server s1 192.168.50.20:80

# another example
# using inline code
frontend www
    bind :80
    use_backend static_assets if { path_beg -i /images/ }


# AND OPERATOR
frontend www
    bind :80
    acl image_url path_beg -i /images/
    acl my_method method GET
    use_backend static_assets if image_url my_method

backend static_assets
    server s1 192.168.50.21:80

# AND v2 - inline acl
frontend www
    bind :80
    use_backend static_assets if { path_beg -i /images/ } { method GET }

# OR OPERATOR
frontend www
    bind :80
    acl image_url path_beg -i /images/
    acl is_jpeg path_end .jpg
    use_backend static_assets if image_url || is_jpeg

backend static_assets
    server s1 192.168.50.20:80

# NEGATION CONDITION
frontend www
    bind :80
    acl image_url path -i -m beg /images/
    acl my_method method POST
    use_backend static_assets if images_url !my_method

backend static_assets
    server s1 192.168.50.20:80

# unless
frontend www
    bind :80
    acl is_php path_end .php
    use_backend static_assets unless is_php

backend static_assets
    server s1 192.168.50.20:80

####### -F =LOADS AFILE
# Consider that we have a file named patterns.txt that contains the following lines:
patterns.txt
/images/
/photos/

# our ACL statement could then check if the requested URL path begins with any of the paths from the file:
frontend www
    bind :80
    acl image_url path -i -m beg -f /patterns.txt
    # If you use -f in conjunction with -m, the -m must come first


# CONFIGURING 2 SERVERS
backend web-backend
    balance roundrobin
    server web1 web1.mydomain.com:80 check
    server web2 web2.mydomain.com:80 check

backend blog-backend
    balance roundrobin
    mode http
    server blog1 blog1.mydomain.com:80 check
    server blog2 blog2.mydomain.com:80 check

# Layer 7 load balancing
frontend http
    bind *:80
    mode http

    acl url_blog path_beg /blog
    use_backend blog-backend if url_blog

    default_backend web-backend


