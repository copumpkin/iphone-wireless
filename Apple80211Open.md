Initializes the Apple80211 library.

` int Apple80211Open(struct Apple80211 **handle); `

**Parameters**

  * _handle_ The (returned) handle to the opened library

**Returns**

  * 0 if successful
  * -1 if the argument is NULL
  * -2 if it was unable to allocate memory for the Apple80211 struct
  * -3 if it was unable to open the socket