# HTTP

What the internet is built on

`Hypertext Transfer Protocol` or **HTTP** is the text-based protocol used to pass information between browser and server over the Internet. First, let's figure out how to make a simple request of a Web server and see what it gives us back.

- the most common design `[HTTP/1.1]` was released in 1997 
- the more current one  `[HTTP/2]` was released in 2015, but adoption has been slow

Say we visit `www.cnn.com`, the computer will send the following command:

```
GET /index.html HTTP/1.1
Host: www.cnn.com
```

### A quick example of what raw `HTTP` looks like using `telnet`

On a mac, install `telnet` a very old and simple way of remotely connecting to another computer

```sh
$ brew install telnet
```

**Step 1:** Open a connection

```sh
$ telnet google.com 80

>>> Trying 142.250.191.46...
    Connected to google.com.
    Escape character is '^]'.
```

**Step 2:** Try a GET command

```sh
$ telnet google.com 80

>>> Trying 142.250.191.46...
    Connected to google.com.
    Escape character is '^]'.

$ GET / HTTP/1.1
```

*Hit return twice*


**Step 3:** Examine the payload that has been returned

```
GET / HTTP/1.1

HTTP/1.1 200 OK
Date: Sat, 05 Nov 2022 19:12:33 GMT
Expires: -1
Cache-Control: private, max-age=0
Content-Type: text/html; charset=ISO-8859-1
P3P: CP="This is not a P3P policy! See g.co/p3phelp for more info."
Server: gws
X-XSS-Protection: 0
X-Frame-Options: SAMEORIGIN
Set-Cookie: 1P_JAR=2022-11-05-19; expires=Mon, 05-Dec-2022 19:12:33 GMT; path=/; domain=.google.com; Secure
Set-Cookie: AEC=AakniGOqX69BBMv6PuuhoFDRbt7_ykU-FfvhRphXWDg8Nc0Zs2VPBceieQA; expires=Thu, 04-May-2023 19:12:33 GMT; path=/; domain=.google.com; Secure; HttpOnly; SameSite=lax
Set-Cookie: NID=511=c8Hk5s4BQl-X_WJU0E43Cxgl1PpuHBPNK_NM7n1QFAwoQYn-2fa7O9leqpnjv3v610d47q47KFEU6LTNeDSdyBXTbP-J_ZtAFLpAHw9SWc8dAw8AxLXpPrlW7vshchjHbZ-1JLp9jUDevfi1hwYcpgKqBqUDzYs0q5ozYRtuiVg; expires=Sun, 07-May-2023 19:12:33 GMT; path=/; domain=.google.com; HttpOnly
Accept-Ranges: none
Vary: Accept-Encoding
Transfer-Encoding: chunked

5b66
<!doctype html>... (then a lot of HTML + JAVASCRIPT here... )
```

A few observations:

`HTTP/1.1 200 OK`:
- `HTTP/1.1` was returned to us
- `200` - is the internet status for a successful request
- `OK` - is another status that lets us know the request was ok.


##### How long do clients wait for an answer or response?

This will vary depending on settings, but on many internet browsers, this is typically set (and can be modified) to `30s`

### Typical Status codes

[Status Codes - Wikipedia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)

There's a lot codes, but here are some common ones:

- `200 OK`: Standard response for successful HTTP requests
- `400 Bad Request`: Usually this means the client asked the wrong way, or was missing a required field
- `403 Forbidden`: Either the client hasn't logged in, or passed proper security to ask a question
- `404 Not Found`: was asking for something that doesn't exist
- `500 Internal Server Error`: this usually means the client did everything ok, but the server had some error in processing the question
- `503 Service Unavailable`: this is similar, the servers could be overloaded answering everyone else's questions, and cannot get to yours

