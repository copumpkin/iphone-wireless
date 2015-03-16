Binds an open library handle to a named wireless interface.

` int Apple80211BindToInterface(struct Apple80211 *handle, CFStringRef interface); `

**Parameters**

  * _handle_ An open handle from an `Apple80211Open` call
  * _interface_ A pointer to a `CFString` containing the interface name (e.g. "en0")