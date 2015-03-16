Returns an array of available 802.11 devices.

` int Apple80211GetIfListCopy(struct Apple80211 *handle, CFArrayRef *list); `

**Parameters**

  * _handle_ An open handle from an ` Apple80211Open` call
  * _list_ The (returned) `CFArrayRef` of `CFStringRef`s containing the available interface names

**Sample output**

```
<CFArray 0x104a40 [0x383e8174]>{type = mutable-small, count = 1, values = (
        0 : <CFString 0x104a60 [0x383e8174]>{contents = "en0"}
)}
```