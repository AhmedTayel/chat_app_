**Index Rooms**
----
  Returns json data about all rooms.

* **URL**

  /rooms

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   None

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"rooms":[{"token":"5d2RR","name":"Room number: 1","chat_count":1,"created_at":"2021-03-19T21:21:46.000Z","updated_at":"2021-03-19T21:21:47.000Z"},...}]}`
 
* **Error Response:**

  * **Code:** None <br />
    **Content:** Returns empty array.

**Show Room**
----
  Returns json data about requested room.

* **URL**

  /rooms/:token

* **Method:**

  `GET`
  
*  **URL Params**
    
   **Required:**

   `token=string`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"room":{"token":"5d2RR","name":"Room number: 1","chat_count":1,"created_at":"2021-03-19T21:21:46.000Z","updated_at":"2021-03-19T21:21:47.000Z"}}`
 
* **Error Response:**

  * **Code:** 404 <br />
    **Content:** `{"error":"Room/Application not found."}`

**Create Room**
----
  Creates and returns json data about requested room.

* **URL**

  /rooms/

* **Method:**

  `POST`
  
*  **URL Params**
    
   **Required:**

   None

* **Data Params**

  `room[name]= string`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"room_created":{"token":"7rYLR","name":"createdRoom","chat_count":0,"created_at":"2021-03-19T22:06:57.000Z","updated_at":"2021-03-19T22:06:57.000Z"}}`
 
* **Error Response:**

  * **Code:** 404 <br />
    **Content:** `{ error: "Error creating room/application"}`

**Index Chats**
----
  Returns json data about requested chats within a room.

* **URL**

  /rooms/:token/chats

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

**Show Chats**
----
  Returns json data about requested chats within a room.

* **URL**

  /rooms/:token/chats/:chat_number

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
  Creates and returns json data about created chat within a room.

* **URL**

  /rooms/:token/chats/:chat_number

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

  /rooms/:token/chats/:chat_number/messages

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

  /rooms/:token/chats/:chat_number/messages/:message_number

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

  /rooms/:token/chats/:chat_number/messages/

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