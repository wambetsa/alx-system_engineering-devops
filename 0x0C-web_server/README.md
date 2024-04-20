0x0C. Web server

A good Software Engineer is a lazy Software Engineer

Read or watch:
- How the web works
- Nginx
- How to Configure Nginx
- Child process concept page
- Root and sub domain
- HTTP requests
- HTTP redirection
- Not found HTTP response code
- Logs files on Linux

#### How to Execute/Run our exercises
##### 0. Transfer a file to your server
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ ./0-transfer_file
    - Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ ssh ubuntu@18.207.236.1 -i ~/.ssh/id_rsa 'ls ~/'

- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ touch some_page.html
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ ./0-transfer_file some_page.html 18.207.236.1 jewstechs ~/.ssh/id_rsa
    - jewstechs@18.207.236.1: Permission denied (publickey).
    - lost connection
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ ./0-transfer_file some_page.html 18.207.236.1 ubuntu ~/.ssh/id_rsa
    - some_page.html                                                                                  100%    0     0.0KB/s   00:00    
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ ssh ubuntu@18.207.236.1 -i ~/.ssh/id_rsa 'ls ~/'
    - some_page.html
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$

##### 1. Install Nginx web server
First install nginx on server and allow it on firewall. To do this run 1-install_nginx_web_server on web01 server

- ubuntu@12704-web-01:~$ curl localhost
    - Hello World!
- ubuntu@12704-web-01:~$ exit
    - logout
    - Connection to 18.207.236.1 closed.
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ curl 18.207.236.1
    - Hello World!
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ curl -sI 18.207.236.1/
    - HTTP/1.1 200 OK
    - Server: nginx/1.18.0 (Ubuntu)
    - Date: Sat, 20 Apr 2024 09:51:07 GMT
    - Content-Type: text/html
    - Content-Length: 13
    - Last-Modified: Sat, 20 Apr 2024 09:37:06 GMT
    - Connection: keep-alive
    - ETag: "66238cc2-d"
    - Accept-Ranges: bytes
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ 

##### 2. Setup a domain name
.TECH domains are top domain providers
YOU can have a free .tech domain for 1 year by following these steps:

- Access the tools space
- Unlock the GitHub student pack: WARNING - this invitation link is unique to you and can’t be reclaimed! If you have any issue, please contact GitHub education support
- And scroll to .Tech domain:
- Start to register your domain and checkout
- At the Checkout step, please click on “Login with GitHub”:
- The cost of the domain should be now at $0
- You can finalize it by creating an account in .Tech domains
- And manage your domain there!
- configure your DNS records with an A entry so that your root domain points to - your web-01 IP address Warning: the propagation of your records can take time (~1-2 hours)
###### Running tests
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ cat 2-setup_a_domain_name
    - wambetsa.tech
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ dig wambetsa.tech
    - ; <<>> DiG 9.18.18-0ubuntu0.22.04.2-Ubuntu <<>> wambetsa.tech
    - ;; global options: +cmd
    - ;; Got answer:
    - ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 44036
    - ;; flags: qr rd ad; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
    - ;; WARNING: recursion requested but not available

    - ;; QUESTION SECTION:
    - ;wambetsa.tech.                 IN      A

    - ;; ANSWER SECTION:
    - wambetsa.tech.          0       IN      A       18.207.236.1

    - ;; Query time: 10 msec
    - ;; SERVER: 172.19.48.1#53(172.19.48.1) (UDP)
    - ;; WHEN: Sat Apr 20 15:10:13 EAT 2024
    - ;; MSG SIZE  rcvd: 60
##### 3-redirection
run 3-redirection script on web01 server
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ curl -sI 18.207.236.1/redirect_me
    - HTTP/1.1 301 Moved Permanently
    - Server: nginx/1.18.0 (Ubuntu)
    - Date: Sat, 20 Apr 2024 12:41:23 GMT
    - Content-Type: text/html
    - Content-Length: 178
    - Connection: keep-alive
    - Location: https://www.youtube.com/watch?v=QH2-TGUlwu4

