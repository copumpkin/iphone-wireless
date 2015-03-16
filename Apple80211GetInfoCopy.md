Retrieves information from the currently bound interface.

` int Apple80211GetInfoCopy(struct Apple80211 *handle, CFDictionaryRef *info); `

**Parameters**

  * _handle_ An open handle from an `Apple80211Open` call, that has also been bound to an interface using `Apple80211BindToInterface`
  * _info_ A (returned) pointer to a CFDictionary containing the information

**Returns**

  * 0 if successful, who knows what else otherwise (seems to be -1 if it doesn't crash)
  * _info_ a `CFDictionaryRef` containing key/value pairs of information about the interface (see below)

**Known `CFDictionary` keys for _info_**

All keys are `CFString`s

  * STATE - An integer `CFNumber` indicating the state of the device. Its value is 4 if the interface is associated
  * SSID\_STR - A `CFString` containing the network name the interface is currently associated with (may be absent if the interface is not associated)
  * POWER - A `CFArray` that appears to contain one `CFNumber` (not sure what it means)
  * BSSID - A `CFString` containing a colon-separated BSSID (MAC address) of the currently associated network (may be absent if the interface is not associated)
  * TXPOWER - An integer `CFNumber` containing the current transmit power?
  * POWERSAVE - An integer `CFNumber` indicating whether the device is currently in power saving mode?
  * RSSI - A `CFDictionary` of information on the signal strength
  * AUTH\_TYPE - A `CFDictionary` of information on the authentication type?
  * SSID - A `CFData` containing the currently associated SSID in an unknown format
  * CHANNEL - A `CFDictionary` containing the channel and channel flags (the flags are currently unknown)
  * RATE - An integer `CFNumber` containing the current rate of the connection (seems to be in megabits per second)

**Sample Output**

The following is the output of a CFShow on the returned CFDictionaryRef:

```
<CFDictionary 0x1031a0 [0x383e8174]>{type = mutable, count = 11, capacity = 12, pairs = (
	0 : <CFString 0x3a6df94c [0x383e8174]>{contents = "STATE"} = <CFNumber 0x104aa0 [0x383e8174]>{value = +4, type = kCFNumberSInt32Type}
	2 : <CFString 0x3a6df9fc [0x383e8174]>{contents = "SSID_STR"} = <CFString 0x104ce0 [0x383e8174]>{contents = "Domus"}
	3 : <CFString 0x3a6df99c [0x383e8174]>{contents = "POWER"} = <CFArray 0x104a60 [0x383e8174]>{type = mutable-small, count = 1, values = (
		0 : <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
	)}
	5 : <CFString 0x3a6dfa0c [0x383e8174]>{contents = "BSSID"} = <CFString 0x104cf0 [0x383e8174]>{contents = "0:11:24:5c:7b:7"}
	6 : <CFString 0x3a6df93c [0x383e8174]>{contents = "TXPOWER"} = <CFNumber 0x104a90 [0x383e8174]>{value = +20, type = kCFNumberSInt32Type}
	7 : <CFString 0x3a6df92c [0x383e8174]>{contents = "POWERSAVE"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
	8 : <CFString 0x3a6df9ac [0x383e8174]>{contents = "RSSI"} = <CFDictionary 0x104af0 [0x383e8174]>{type = mutable, count = 2, capacity = 3, pairs = (
		0 : <CFString 0x3a6dfdcc [0x383e8174]>{contents = "RSSI_CTL_AGR"} = <CFNumber 0x104b50 [0x383e8174]>{value = +21, type = kCFNumberSInt32Type}
		3 : <CFString 0x3a6dfe0c [0x383e8174]>{contents = "RSSI_UNIT"} = <CFNumber 0x103210 [0x383e8174]>{value = +80, type = kCFNumberSInt32Type}
	)}
	9 : <CFString 0x3a6df9cc [0x383e8174]>{contents = "AUTH_TYPE"} = <CFDictionary 0x104c50 [0x383e8174]>{type = mutable, count = 2, capacity = 3, pairs = (
		2 : <CFString 0x3a6dfc2c [0x383e8174]>{contents = "AUTH_LOWER"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
		3 : <CFString 0x3a6dfc3c [0x383e8174]>{contents = "AUTH_UPPER"} = <CFNumber 0x104aa0 [0x383e8174]>{value = +4, type = kCFNumberSInt32Type}
	)}
	10 : <CFString 0x3a6df9ec [0x383e8174]>{contents = "SSID"} = <CFData 0x104ad0 [0x383e8174]>{length = 5, capacity = 16, bytes = 0x446f6d7573}
	12 : <CFString 0x3a6df9bc [0x383e8174]>{contents = "CHANNEL"} = <CFDictionary 0x104b60 [0x383e8174]>{type = mutable, count = 2, capacity = 3, pairs = (
		0 : <CFString 0x3a6df9bc [0x383e8174]>{contents = "CHANNEL"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
		1 : <CFString 0x3a6dfa3c [0x383e8174]>{contents = "CHANNEL_FLAGS"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
	)}
	13 : <CFString 0x3a6df98c [0x383e8174]>{contents = "RATE"} = <CFNumber 0x103200 [0x383e8174]>{value = +54, type = kCFNumberSInt32Type}
)}
```