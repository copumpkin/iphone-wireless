Retrieves the name of the currently bound interface.

` int Apple80211GetInterfaceNameCopy(struct Apple80211 *handle, CFStringRef *name); `

**Parameters**

  * _handle_ An open handle from an `Apple80211Open` call, that has also been bound to an interface using `Apple80211BindToInterface`
  * _name_ A (returned) pointer to a `CFStringRef` containing the name