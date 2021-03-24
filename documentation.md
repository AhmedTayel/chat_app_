**Index Applications**
----
  Returns json data about all applications.

* **URL**

  /applications

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   None

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"applications":[{"token":"5d2RR","name":"Application number: 1","chat_count":1,"created_at":"2021-03-19T21:21:46.000Z","updated_at":"2021-03-19T21:21:47.000Z"},...}]}`
 
* **Error Response:**

  * **Code:** None <br />
    **Content:** Returns empty array.

**Show Application**
----
  Returns json data about requested application.

* **URL**

  /applications/:token

* **Method:**

  `GET`
  
*  **URL Params**
    
   **Required:**

   `token=string`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"application":{"token":"5d2RR","name":"Application number: 1","chat_count":1,"created_at":"2021-03-19T21:21:46.000Z","updated_at":"2021-03-19T21:21:47.000Z"}}`
 
* **Error Response:**

  * **Code:** 404 <br />
    **Content:** `{"error":"Application not found."}`

**Create Application**
----
  Creates and returns json data about requested application.

* **URL**

  /applications/

* **Method:**

  `POST`
  
*  **URL Params**
    
   **Required:**

   None

* **Data Params**

  `room[name]= string`
  Please look at comment.

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"application_created":{"token":"7rYLR","name":"createdApplication","chat_count":0,"created_at":"2021-03-19T22:06:57.000Z","updated_at":"2021-03-19T22:06:57.000Z"}}`
 
* **Error Response:**

  * **Code:** 404 <br />
    **Content:** `{ error: "Error creating application."}`

  * **Comment:**
  * **Please note that the parameter you send POST CREATE function is titled room not application.**

**Update Application**
----
  Update and returns json data about an application.

* **URL**

  /applications

* **Method:**

  `PATCH`
  
*  **URL Params**

   **Required:**
 
   None

* **Data Params**

  `room[name]=string`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"application_updated":{"token":"7rYLR","name":"createdApplication","chat_count":0,"created_at":"2021-03-19T22:06:57.000Z","updated_at":"2021-03-19T22:06:57.000Z"}}`
 
* **Error Response:**

  * **Code:** 404 <br />
    **Content:** `{ error: "Error updating application."}`
    
**Index Chats**
----
  Returns json data about requested chats within a application.

* **URL**

  /applications/:token/chats

* **Method:**

  `GET`
  
*  **URL Params**
    
   **Required:**

   None

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"chats":[{"1":{"chat_number":1,"message_count":0,"created_at":"2021-03-19T22:11:27.000Z","updated_at":"2021-03-19T22:11:27.000Z"}}]}`
 
* **Error Response:**

  * **Code:** None <br />
    **Content:** Returns empty array.

**Show Chat**
----
  Returns json data about requested chats within a application.

* **URL**

  /applications/:token/chats/:chat_number

* **Method:**

  `GET`
  
*  **URL Params**
    
   **Required:**

   `chat_number= integer`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"chat":[{"chat_number":1,"message_count":0,"created_at":"2021-03-19T22:11:27.000Z","updated_at":"2021-03-19T22:11:27.000Z"}]}`
 
* **Error Response:**

  * **Code:** 404 <br />
    **Content:** `{"error":"Chat not found"}`
* **Comment:**
  * **The number given to the json object when calling `/chats` is identical to the attribute `chat_number`, use either value to fetch the desired chat.**

**Create Chat**
----
  Creates and returns json data about created chat within a application.

* **URL**

  /applications/:token/chats/:chat_number

* **Method:**

  `POST`
  
*  **URL Params**
    
   **Required:**

   None

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"chat_created":{"chat_number":1,"message_count":0,"created_at":"2021-03-19T22:11:27.000Z","updated_at":"2021-03-19T22:11:27.000Z"}}`
 
* **Error Response:**

  * **Code:** None <br />
    **Content:** None

**Index Messages**
----
  Returns json data about messages within a chat.

* **URL**

  /applications/:token/chats/:chat_number/messages

* **Method:**

  `GET`
  
*  **URL Params**
    
   **Required:**

   None

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"messages":[{"1":{"message_number":1,"content":"helloooo","created_at":"2021-03-19T22:21:23.000Z","updated_at":"2021-03-19T22:21:23.000Z"}}]}`
 
* **Error Response:**

  * **Code:** None <br />
    **Content:** None

**Show Message**
----
  Returns json data about a message within a chat.

* **URL**

  /applications/:token/chats/:chat_number/messages/:message_number

* **Method:**

  `GET`
  
*  **URL Params**
    
   **Required:**

   `message_number= integer`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"message":{"message_number":1,"content":"helloooo","created_at":"2021-03-19T22:21:23.000Z","updated_at":"2021-03-19T22:21:23.000Z"}}`

* **Error Response:**

  * **Code:** 404 <br />
    **Content:** `{"error": "Couldn't find message."}`
* **Comment:**
  * **The number given to the json object when calling `/messages` is identical to the attribute `message_number`, use either value to fetch the desired chat.**

**Create Message**
----
  Creates and returns json data about a created message within a chat.

* **URL**

  /applications/:token/chats/:chat_number/messages/

* **Method:**

  `POST`
  
*  **URL Params**

   **Required:**

   None

* **Data Params**

  `message[content]=string`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"message_created":{"message_number":3,"content":"helloooo","created_at":"2021-03-19T22:38:01.000Z","updated_at":"2021-03-19T22:38:01.000Z"}}`

* **Error Response:**

  * **Code:** None <br />
    **Content:** None

**Update Message**
----
  Update and returns json data about a message.

* **URL**

   /applications/:token/chats/:chat_number/messages/:message_number

* **Method:**

  `PATCH`
  
*  **URL Params**

   **Required:**
 
   None

* **Data Params**

  `content[content]=string`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"message_updated":{"message_number":3,"content":"helloooo","created_at":"2021-03-19T22:38:01.000Z","updated_at":"2021-03-19T22:38:01.000Z"}}`
 
* **Error Response:**

  * **Code:** 404 <br />
    **Content:** `{ error: "Error updating message."}`

**Search Messages in a chat**
----
  Searches for messages with a chat and returns the messages if found.

* **URL**

  /applications/:token/chats/:chat_number/messages/search?query=query

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**

   `query=string`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"hits":1,"result":[{"_index":"messages","_type":"_doc","_id":"1","_score":1.023669,"_source":{"chat_id":1,"message_number":1,"content":"This is a message at index: 1","created_at":"2021-03-22T00:14:50.000Z","updated_at":"2021-03-22T00:14:50.000Z"}}]}`

* **Error Response:**

  * **Code:** None <br />
    **Content:** None