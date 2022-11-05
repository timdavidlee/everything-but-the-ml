# API, RESTFUL, Webhook?

#### Dear Data scientist,

There are two common situations every team + model will struggle with:

1. Scraping or collecting enough data to train on
2. Providing a flexible interface to show your wonderful trained model. There's a lot of the world that does not run on python!

Understanding APIs will help you , get data from outside sources
**Designing** APIs will let you share your predictive services to the world

## API:

To retrieve information or perform a function, an **`API`** helps you communicate what you want to that system so it can understand and fulfill the request.  API as a mediator between the users or clients and the resources or web services they want to get.

Another advantage of an API is that you don’t have to know the specifics of caching—how your resource is retrieved or where it comes from.

#### Key Vocab:

- **Request**: when a client (phone, web browser, computer) asks for data, its a `request`
    - "Send me the front page of the web"
    - "What's the last thing i ordered?"
    - "Can you give me my latest emails?"
- **Payload**: when a server (bit website, centralized database) returns the answer its typically referred to as a `payload`
- **Polling**: when a client checks in with a server to see if any `state` as changed:
    - new address for a user
    - did a payment come through?
    - has my package been shipped?

#### Most common format for payloads are:

- raw text
- json [see json lesson]


#### A great app to help troubleshoot API:

[Postman](https://www.postman.com/downloads/)

## RESTFul

```
Representational State Transfer (REST)
```

## Webhooks

A webhook is an HTTP-based callback function that allows lightweight, event-driven communication between 2 APIs. Webhooks are used by a wide variety of web apps to receive small amounts of data from other apps. These are often referred to as `reverse APIs` or `push APIs`


## What are protocol buffers, and why should i care?

> Protocol buffers are Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data – think XML, but smaller, faster, and simpler.

- Work with all languages
- Designed to make very small + compact messages


### gRPC

[https://grpc.io/](https://grpc.io/)

Is another way to connect services together that can run on any environment