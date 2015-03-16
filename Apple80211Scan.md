Performs a (passive) scan for networks.

` int Apple80211Scan(struct Apple80211 *handle, CFArrayRef *list, CFDictionaryRef *parameters); `

**Parameters**

  * _handle_ An open handle from an ` Apple80211Open` call, that has also been bound to an interface using`Apple80211BindToInterface`
  * _list_ The (returned) `CFArrayRef` of `CFDictionaryRef`s containing information on each discovered network
  * _parameters_ A `CFDictionaryRef` that contains scan parameters (see below)

**Returns**

  * 0 if successful. -1 if invalid arguments were passed in. More error values to come eventually.
  * (by reference) _list_ a `CFArrayRef` containing a `CFDictionaryRef` for each of the discovered networks

**Known keys for the _parameters_ dictionary**

All keys are `CFString`s

  * SSID - A `CFData` that requests which ESSID (network name) should be scanned
  * SSID\_STR - A `CFString` version of the SSID
  * SCAN\_CHANNELS - A `CFArray` of `CFDictionary` objects, each containing `CFString`s for "CHANNEL" and "CHANNEL\_FLAGS"
  * SCAN\_MERGE (true if unspecified) - A `CFBoolean` that specifies whether the function should discard multiple BSSIDs for the same network name.
  * SCAN\_FLAGS (0 if unspecified)
  * SCAN\_RSSI\_THRESHOLD
  * SCAN\_BSS\_TYPE (3 if unspecified)
  * SCAN\_TYPE (1 if unspecified)
  * SCAN\_PHY\_MODE (1 if unspecified)
  * SCAN\_DWELL\_TIME (0 if unspecified)
  * SCAN\_REST\_TIME (0 if unspecified)

**Known dictionary keys for networks**

All keys are `CFString`s

  * SSID\_STR - A `CFString` containing the ESSID (network name) of the network
  * RSN\_IE - A `CFDictionary` of information on the RSN
  * WEP - A `CFBoolean` indicating whether the network is WEP-enabled
  * RSSI - An integer `CFNumber` indicating signal strength ([wikipedia](http://en.wikipedia.org/wiki/RSSI))
  * AP\_MODE - An integer `CFNumber` (possibly showing whether the network is from an AP or is an ad-hoc network)
  * SSID - A `CFData` containing the raw bytes of the network name
  * CHANNEL - An integer `CFNumber` of the channel the network was seen on
  * CHANNEL\_FLAGS - An integer `CFNumber` (though I don't know what channel flags exist)
  * BEACON\_INT - An integer `CFNumber` probably indicating the network's beacon interval (but I don't know the units yet)
  * CAPABILITIES - An integer `CFNumber` probably containing flags for the network's capabilities (possibly whether it's a/b/g?)
  * scanWasDirected - A `CFBoolean` possibly indicating whether the scan was specifically directed at the network?
  * IE - A `CFData` containing miscellaneous information elements found on the beacons (I'm assuming)
  * APPLE\_IE - A `CFDictionary` containing parsed Apple-specific (from Airport base stations) properties
  * BSSID - A `CFString` containing a standard colon-separated BSSID (MAC address) but that doesn't have leading 0's in the case of single hex digits
  * HIDDEN\_NETWORK - A `CFBoolean` indicating whether the network is hidden (implies that it's performing a passive scan – verified)
  * AGE - An integer `CFNumber` possibly indicating whether this is a cached network from a previous scan?
  * NOISE - An integer `CFNumber` that appears to quantify how noisy the network signal is


**Sample Output**

The following is a `CFShow` of the list parameter returned by the call:

```
<CFArray 0x104d50 [0x383e8174]>{type = mutable-small, count = 9, values = (
        0 : <CFDictionary 0x104d70 [0x383e8174]>{type = mutable, count = 18, capacity = 24, pairs = (
        2 : <CFString 0x3a6df9fc [0x383e8174]>{contents = "SSID_STR"} = <CFString 0x104db0 [0x383e8174]>{contents = "Domus"}
        3 : <CFString 0x3a6dff6c [0x383e8174]>{contents = "RSN_IE"} = <CFDictionary 0x104ee0 [0x383e8174]>{type = mutable, count = 4, capacity = 6, pairs = (
        2 : <CFString 0x3a6dff3c [0x383e8174]>{contents = "IE_KEY_RSN_UCIPHERS"} = <CFArray 0x104ea0 [0x383e8174]>{type = mutable-small, count = 1, values = (
        0 : <CFNumber 0x104aa0 [0x383e8174]>{value = +4, type = kCFNumberSInt32Type}
)}
        4 : <CFString 0x3a6dff5c [0x383e8174]>{contents = "IE_KEY_RSN_VERSION"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        6 : <CFString 0x3a6dff4c [0x383e8174]>{contents = "IE_KEY_RSN_AUTHSELS"} = <CFArray 0x105120 [0x383e8174]>{type = mutable-small, count = 1, values = (
        0 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
)}
        7 : <CFString 0x3a6dff2c [0x383e8174]>{contents = "IE_KEY_RSN_MCIPHER"} = <CFNumber 0x104aa0 [0x383e8174]>{value = +4, type = kCFNumberSInt32Type}
)}
        7 : <CFString 0x3a6dfa1c [0x383e8174]>{contents = "WEP"} = <CFBoolean 0x383e8388 [0x383e8174]>{value = true}
        8 : <CFString 0x3a6df9ac [0x383e8174]>{contents = "RSSI"} = <CFNumber 0x104e40 [0x383e8174]>{value = +63, type = kCFNumberSInt32Type}
        9 : <CFString 0x3a6dfa5c [0x383e8174]>{contents = "AP_MODE"} = <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        10 : <CFString 0x3a6df9ec [0x383e8174]>{contents = "SSID"} = <CFData 0x104dc0 [0x383e8174]>{length = 5, capacity = 5, bytes = 0x446f6d7573}
        12 : <CFString 0x3a6df9bc [0x383e8174]>{contents = "CHANNEL"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        13 : <CFString 0x3a6dfa3c [0x383e8174]>{contents = "CHANNEL_FLAGS"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
        14 : <CFString 0x3a6dfa4c [0x383e8174]>{contents = "BEACON_INT"} = <CFNumber 0x104e20 [0x383e8174]>{value = +10, type = kCFNumberSInt32Type}
        16 : <CFString 0x3a6dfa2c [0x383e8174]>{contents = "CAPABILITIES"} = <CFNumber 0x104e90 [0x383e8174]>{value = +1073, type = kCFNumberSInt32Type}
        17 : <CFString 0x3a6dfa6c [0x383e8174]>{contents = "scanWasDirected"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        18 : <CFString 0x3a6dfaac [0x383e8174]>{contents = "IE"} = <CFData 0x1051e0 [0x383e8174]>{length = 130, capacity = 130, bytes = 0x30140100000fac040100000fac040100 ... 0100010100000003}
        20 : <CFString 0x3a6dffdc [0x383e8174]>{contents = "APPLE_IE"} = <CFDictionary 0x1051a0 [0x383e8174]>{type = mutable, count = 3, capacity = 3, pairs = (
        0 : <CFString 0x3a6dff7c [0x383e8174]>{contents = "APPLE_IE_VERSION"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        1 : <CFString 0x3a6dff8c [0x383e8174]>{contents = "APPLE_IE_PRODUCT_ID"} = <CFNumber 0x104f40 [0x383e8174]>{value = +104, type = kCFNumberSInt32Type}
        2 : <CFString 0x3a6dffbc [0x383e8174]>{contents = "APPLE_IE_WSC_CAP"} = <CFBoolean 0x383e8388 [0x383e8174]>{value = true}
)}
        21 : <CFString 0x3a6dfa0c [0x383e8174]>{contents = "BSSID"} = <CFString 0x104df0 [0x383e8174]>{contents = "0:1b:63:2b:38:bc"}
        24 : <CFString 0x3a6dfa8c [0x383e8174]>{contents = "RATES"} = <CFArray 0x104e70 [0x383e8174]>{type = mutable-small, count = 12, values = (
        0 : <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        1 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        2 : <CFNumber 0x104f50 [0x383e8174]>{value = +5, type = kCFNumberSInt32Type}
        3 : <CFNumber 0x104f60 [0x383e8174]>{value = +6, type = kCFNumberSInt32Type}
        4 : <CFNumber 0x104f70 [0x383e8174]>{value = +9, type = kCFNumberSInt32Type}
        5 : <CFNumber 0x104f80 [0x383e8174]>{value = +11, type = kCFNumberSInt32Type}
        6 : <CFNumber 0x104e50 [0x383e8174]>{value = +12, type = kCFNumberSInt32Type}
        7 : <CFNumber 0x104e60 [0x383e8174]>{value = +18, type = kCFNumberSInt32Type}
        8 : <CFNumber 0x104fe0 [0x383e8174]>{value = +24, type = kCFNumberSInt32Type}
        9 : <CFNumber 0x104ff0 [0x383e8174]>{value = +36, type = kCFNumberSInt32Type}
        10 : <CFNumber 0x105000 [0x383e8174]>{value = +48, type = kCFNumberSInt32Type}
        11 : <CFNumber 0x105010 [0x383e8174]>{value = +54, type = kCFNumberSInt32Type}
)}
        27 : <CFString 0x3a6dfa7c [0x383e8174]>{contents = "HIDDEN_NETWORK"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        28 : <CFString 0x3a6dfa9c [0x383e8174]>{contents = "AGE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
        31 : <CFString 0x3a6df97c [0x383e8174]>{contents = "NOISE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
)}
        1 : <CFDictionary 0x1052b0 [0x383e8174]>{type = mutable, count = 16, capacity = 24, pairs = (
        2 : <CFString 0x3a6df9fc [0x383e8174]>{contents = "SSID_STR"} = <CFString 0x1052f0 [0x383e8174]>{contents = "Buffalo"}
        8 : <CFString 0x3a6df9ac [0x383e8174]>{contents = "RSSI"} = <CFNumber 0x104e50 [0x383e8174]>{value = +12, type = kCFNumberSInt32Type}
        9 : <CFString 0x3a6dfa5c [0x383e8174]>{contents = "AP_MODE"} = <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        10 : <CFString 0x3a6df9ec [0x383e8174]>{contents = "SSID"} = <CFData 0x105310 [0x383e8174]>{length = 7, capacity = 7, bytes = 0x42756666616c6f}
        11 : <CFString 0x3a6dff1c [0x383e8174]>{contents = "WPA_IE"} = <CFDictionary 0x105410 [0x383e8174]>{type = mutable, count = 4, capacity = 6, pairs = (
        0 : <CFString 0x3a6dfeec [0x383e8174]>{contents = "IE_KEY_WPA_UCIPHERS"} = <CFArray 0x1053d0 [0x383e8174]>{type = mutable-small, count = 1, values = (
        0 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
)}
        1 : <CFString 0x3a6dfedc [0x383e8174]>{contents = "IE_KEY_WPA_MCIPHER"} = <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        3 : <CFString 0x3a6dfefc [0x383e8174]>{contents = "IE_KEY_WPA_AUTHSELS"} = <CFArray 0x1055e0 [0x383e8174]>{type = mutable-small, count = 1, values = (
        0 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
)}
        4 : <CFString 0x3a6dff0c [0x383e8174]>{contents = "IE_KEY_WPA_VERSION"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
)}
        12 : <CFString 0x3a6df9bc [0x383e8174]>{contents = "CHANNEL"} = <CFNumber 0x104e20 [0x383e8174]>{value = +10, type = kCFNumberSInt32Type}
        13 : <CFString 0x3a6dfa3c [0x383e8174]>{contents = "CHANNEL_FLAGS"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
        14 : <CFString 0x3a6dfa4c [0x383e8174]>{contents = "BEACON_INT"} = <CFNumber 0x104e20 [0x383e8174]>{value = +10, type = kCFNumberSInt32Type}
        16 : <CFString 0x3a6dfa2c [0x383e8174]>{contents = "CAPABILITIES"} = <CFNumber 0x105370 [0x383e8174]>{value = +1041, type = kCFNumberSInt32Type}
        17 : <CFString 0x3a6dfa6c [0x383e8174]>{contents = "scanWasDirected"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        18 : <CFString 0x3a6dfaac [0x383e8174]>{contents = "IE"} = <CFData 0x105660 [0x383e8174]>{length = 193, capacity = 193, bytes = 0xdd800050f204104a0001101044000102 ... 42435e0062322f00}
        21 : <CFString 0x3a6dfa0c [0x383e8174]>{contents = "BSSID"} = <CFString 0x105340 [0x383e8174]>{contents = "0:16:1:d6:27:49"}
        24 : <CFString 0x3a6dfa8c [0x383e8174]>{contents = "RATES"} = <CFArray 0x1053b0 [0x383e8174]>{type = mutable-small, count = 12, values = (
        0 : <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        1 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        2 : <CFNumber 0x104f50 [0x383e8174]>{value = +5, type = kCFNumberSInt32Type}
        3 : <CFNumber 0x104f80 [0x383e8174]>{value = +11, type = kCFNumberSInt32Type}
        4 : <CFNumber 0x104f60 [0x383e8174]>{value = +6, type = kCFNumberSInt32Type}
        5 : <CFNumber 0x104f70 [0x383e8174]>{value = +9, type = kCFNumberSInt32Type}
        6 : <CFNumber 0x104e50 [0x383e8174]>{value = +12, type = kCFNumberSInt32Type}
        7 : <CFNumber 0x105360 [0x383e8174]>{value = +18, type = kCFNumberSInt32Type}
        8 : <CFNumber 0x105380 [0x383e8174]>{value = +24, type = kCFNumberSInt32Type}
        9 : <CFNumber 0x105390 [0x383e8174]>{value = +36, type = kCFNumberSInt32Type}
        10 : <CFNumber 0x1053a0 [0x383e8174]>{value = +48, type = kCFNumberSInt32Type}
        11 : <CFNumber 0x1054d0 [0x383e8174]>{value = +54, type = kCFNumberSInt32Type}
)}
        27 : <CFString 0x3a6dfa7c [0x383e8174]>{contents = "HIDDEN_NETWORK"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        28 : <CFString 0x3a6dfa9c [0x383e8174]>{contents = "AGE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
        31 : <CFString 0x3a6df97c [0x383e8174]>{contents = "NOISE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
)}
        2 : <CFDictionary 0x105780 [0x383e8174]>{type = mutable, count = 18, capacity = 24, pairs = (
        2 : <CFString 0x3a6df9fc [0x383e8174]>{contents = "SSID_STR"} = <CFString 0x105450 [0x383e8174]>{contents = "Domus"}
        3 : <CFString 0x3a6dff6c [0x383e8174]>{contents = "RSN_IE"} = <CFDictionary 0x105880 [0x383e8174]>{type = mutable, count = 4, capacity = 6, pairs = (
        2 : <CFString 0x3a6dff3c [0x383e8174]>{contents = "IE_KEY_RSN_UCIPHERS"} = <CFArray 0x105840 [0x383e8174]>{type = mutable-small, count = 1, values = (
        0 : <CFNumber 0x104aa0 [0x383e8174]>{value = +4, type = kCFNumberSInt32Type}
)}
        4 : <CFString 0x3a6dff5c [0x383e8174]>{contents = "IE_KEY_RSN_VERSION"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        6 : <CFString 0x3a6dff4c [0x383e8174]>{contents = "IE_KEY_RSN_AUTHSELS"} = <CFArray 0x105a60 [0x383e8174]>{type = mutable-small, count = 1, values = (
        0 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
)}
        7 : <CFString 0x3a6dff2c [0x383e8174]>{contents = "IE_KEY_RSN_MCIPHER"} = <CFNumber 0x104aa0 [0x383e8174]>{value = +4, type = kCFNumberSInt32Type}
)}
        7 : <CFString 0x3a6dfa1c [0x383e8174]>{contents = "WEP"} = <CFBoolean 0x383e8388 [0x383e8174]>{value = true}
        8 : <CFString 0x3a6df9ac [0x383e8174]>{contents = "RSSI"} = <CFNumber 0x1057f0 [0x383e8174]>{value = +23, type = kCFNumberSInt32Type}
        9 : <CFString 0x3a6dfa5c [0x383e8174]>{contents = "AP_MODE"} = <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        10 : <CFString 0x3a6df9ec [0x383e8174]>{contents = "SSID"} = <CFData 0x1057c0 [0x383e8174]>{length = 5, capacity = 5, bytes = 0x446f6d7573}
        12 : <CFString 0x3a6df9bc [0x383e8174]>{contents = "CHANNEL"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        13 : <CFString 0x3a6dfa3c [0x383e8174]>{contents = "CHANNEL_FLAGS"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
        14 : <CFString 0x3a6dfa4c [0x383e8174]>{contents = "BEACON_INT"} = <CFNumber 0x104e20 [0x383e8174]>{value = +10, type = kCFNumberSInt32Type}
        16 : <CFString 0x3a6dfa2c [0x383e8174]>{contents = "CAPABILITIES"} = <CFNumber 0x105470 [0x383e8174]>{value = +1041, type = kCFNumberSInt32Type}
        17 : <CFString 0x3a6dfa6c [0x383e8174]>{contents = "scanWasDirected"} = <CFBoolean 0x383e8388 [0x383e8174]>{value = true}
        18 : <CFString 0x3a6dfaac [0x383e8174]>{contents = "IE"} = <CFData 0x105b20 [0x383e8174]>{length = 39, capacity = 39, bytes = 0x30140100000fac040100000fac040100 ... dd06001018020200}
        20 : <CFString 0x3a6dffdc [0x383e8174]>{contents = "APPLE_IE"} = <CFDictionary 0x105ae0 [0x383e8174]>{type = mutable, count = 2, capacity = 3, pairs = (
        0 : <CFString 0x3a6dff7c [0x383e8174]>{contents = "APPLE_IE_VERSION"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        1 : <CFString 0x3a6dff8c [0x383e8174]>{contents = "APPLE_IE_PRODUCT_ID"} = <CFNumber 0x1058e0 [0x383e8174]>{value = +102, type = kCFNumberSInt32Type}
)}
        21 : <CFString 0x3a6dfa0c [0x383e8174]>{contents = "BSSID"} = <CFString 0x105290 [0x383e8174]>{contents = "0:11:24:5c:7b:7"}
        24 : <CFString 0x3a6dfa8c [0x383e8174]>{contents = "RATES"} = <CFArray 0x105820 [0x383e8174]>{type = mutable-small, count = 12, values = (
        0 : <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        1 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        2 : <CFNumber 0x104f50 [0x383e8174]>{value = +5, type = kCFNumberSInt32Type}
        3 : <CFNumber 0x104f80 [0x383e8174]>{value = +11, type = kCFNumberSInt32Type}
        4 : <CFNumber 0x104f60 [0x383e8174]>{value = +6, type = kCFNumberSInt32Type}
        5 : <CFNumber 0x104f70 [0x383e8174]>{value = +9, type = kCFNumberSInt32Type}
        6 : <CFNumber 0x104e50 [0x383e8174]>{value = +12, type = kCFNumberSInt32Type}
        7 : <CFNumber 0x105460 [0x383e8174]>{value = +18, type = kCFNumberSInt32Type}
        8 : <CFNumber 0x105800 [0x383e8174]>{value = +24, type = kCFNumberSInt32Type}
        9 : <CFNumber 0x105810 [0x383e8174]>{value = +36, type = kCFNumberSInt32Type}
        10 : <CFNumber 0x105940 [0x383e8174]>{value = +48, type = kCFNumberSInt32Type}
        11 : <CFNumber 0x105950 [0x383e8174]>{value = +54, type = kCFNumberSInt32Type}
)}
        27 : <CFString 0x3a6dfa7c [0x383e8174]>{contents = "HIDDEN_NETWORK"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        28 : <CFString 0x3a6dfa9c [0x383e8174]>{contents = "AGE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
        31 : <CFString 0x3a6df97c [0x383e8174]>{contents = "NOISE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
)}
        3 : <CFDictionary 0x105b70 [0x383e8174]>{type = mutable, count = 14, capacity = 24, pairs = (
        2 : <CFString 0x3a6df9fc [0x383e8174]>{contents = "SSID_STR"} = <CFString 0x105bb0 [0x383e8174]>{contents = "Greenwave"}
        8 : <CFString 0x3a6df9ac [0x383e8174]>{contents = "RSSI"} = <CFNumber 0x104e50 [0x383e8174]>{value = +12, type = kCFNumberSInt32Type}
        9 : <CFString 0x3a6dfa5c [0x383e8174]>{contents = "AP_MODE"} = <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        10 : <CFString 0x3a6df9ec [0x383e8174]>{contents = "SSID"} = <CFData 0x105bd0 [0x383e8174]>{length = 9, capacity = 9, bytes = 0x477265656e77617665}
        12 : <CFString 0x3a6df9bc [0x383e8174]>{contents = "CHANNEL"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        13 : <CFString 0x3a6dfa3c [0x383e8174]>{contents = "CHANNEL_FLAGS"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
        14 : <CFString 0x3a6dfa4c [0x383e8174]>{contents = "BEACON_INT"} = <CFNumber 0x104e20 [0x383e8174]>{value = +10, type = kCFNumberSInt32Type}
        16 : <CFString 0x3a6dfa2c [0x383e8174]>{contents = "CAPABILITIES"} = <CFNumber 0x105c30 [0x383e8174]>{value = +33, type = kCFNumberSInt32Type}
        17 : <CFString 0x3a6dfa6c [0x383e8174]>{contents = "scanWasDirected"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        21 : <CFString 0x3a6dfa0c [0x383e8174]>{contents = "BSSID"} = <CFString 0x105c00 [0x383e8174]>{contents = "0:40:96:57:eb:59"}
        24 : <CFString 0x3a6dfa8c [0x383e8174]>{contents = "RATES"} = <CFArray 0x105c60 [0x383e8174]>{type = mutable-small, count = 4, values = (
        0 : <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        1 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        2 : <CFNumber 0x104f50 [0x383e8174]>{value = +5, type = kCFNumberSInt32Type}
        3 : <CFNumber 0x104f80 [0x383e8174]>{value = +11, type = kCFNumberSInt32Type}
)}
        27 : <CFString 0x3a6dfa7c [0x383e8174]>{contents = "HIDDEN_NETWORK"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        28 : <CFString 0x3a6dfa9c [0x383e8174]>{contents = "AGE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
        31 : <CFString 0x3a6df97c [0x383e8174]>{contents = "NOISE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
)}
        4 : <CFDictionary 0x105cc0 [0x383e8174]>{type = mutable, count = 14, capacity = 24, pairs = (
        2 : <CFString 0x3a6df9fc [0x383e8174]>{contents = "SSID_STR"} = <CFString 0x105c40 [0x383e8174]>{contents = "04Z409068593"}
        8 : <CFString 0x3a6df9ac [0x383e8174]>{contents = "RSSI"} = <CFNumber 0x104e50 [0x383e8174]>{value = +12, type = kCFNumberSInt32Type}
        9 : <CFString 0x3a6dfa5c [0x383e8174]>{contents = "AP_MODE"} = <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        10 : <CFString 0x3a6df9ec [0x383e8174]>{contents = "SSID"} = <CFData 0x105c80 [0x383e8174]>{length = 12, capacity = 12, bytes = 0x30345a343039303638353933}
        12 : <CFString 0x3a6df9bc [0x383e8174]>{contents = "CHANNEL"} = <CFNumber 0x104f60 [0x383e8174]>{value = +6, type = kCFNumberSInt32Type}
        13 : <CFString 0x3a6dfa3c [0x383e8174]>{contents = "CHANNEL_FLAGS"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
        14 : <CFString 0x3a6dfa4c [0x383e8174]>{contents = "BEACON_INT"} = <CFNumber 0x104e20 [0x383e8174]>{value = +10, type = kCFNumberSInt32Type}
        16 : <CFString 0x3a6dfa2c [0x383e8174]>{contents = "CAPABILITIES"} = <CFNumber 0x105e50 [0x383e8174]>{value = +1121, type = kCFNumberSInt32Type}
        17 : <CFString 0x3a6dfa6c [0x383e8174]>{contents = "scanWasDirected"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        21 : <CFString 0x3a6dfa0c [0x383e8174]>{contents = "BSSID"} = <CFString 0x105e30 [0x383e8174]>{contents = "0:e0:98:bf:23:6c"}
        24 : <CFString 0x3a6dfa8c [0x383e8174]>{contents = "RATES"} = <CFArray 0x105e80 [0x383e8174]>{type = mutable-small, count = 13, values = (
        0 : <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        1 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        2 : <CFNumber 0x104f50 [0x383e8174]>{value = +5, type = kCFNumberSInt32Type}
        3 : <CFNumber 0x104f80 [0x383e8174]>{value = +11, type = kCFNumberSInt32Type}
        4 : <CFNumber 0x105c20 [0x383e8174]>{value = +22, type = kCFNumberSInt32Type}
        5 : <CFNumber 0x104f60 [0x383e8174]>{value = +6, type = kCFNumberSInt32Type}
        6 : <CFNumber 0x104f70 [0x383e8174]>{value = +9, type = kCFNumberSInt32Type}
        7 : <CFNumber 0x104e50 [0x383e8174]>{value = +12, type = kCFNumberSInt32Type}
        8 : <CFNumber 0x105e60 [0x383e8174]>{value = +18, type = kCFNumberSInt32Type}
        9 : <CFNumber 0x105e70 [0x383e8174]>{value = +24, type = kCFNumberSInt32Type}
        10 : <CFNumber 0x105fa0 [0x383e8174]>{value = +36, type = kCFNumberSInt32Type}
        11 : <CFNumber 0x105fb0 [0x383e8174]>{value = +48, type = kCFNumberSInt32Type}
        12 : <CFNumber 0x105fc0 [0x383e8174]>{value = +54, type = kCFNumberSInt32Type}
)}
        27 : <CFString 0x3a6dfa7c [0x383e8174]>{contents = "HIDDEN_NETWORK"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        28 : <CFString 0x3a6dfa9c [0x383e8174]>{contents = "AGE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
        31 : <CFString 0x3a6df97c [0x383e8174]>{contents = "NOISE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
)}
        5 : <CFDictionary 0x105ee0 [0x383e8174]>{type = mutable, count = 14, capacity = 24, pairs = (
        2 : <CFString 0x3a6df9fc [0x383e8174]>{contents = "SSID_STR"} = <CFString 0x105f20 [0x383e8174]>{contents = "Greenwave"}
        8 : <CFString 0x3a6df9ac [0x383e8174]>{contents = "RSSI"} = <CFNumber 0x1060f0 [0x383e8174]>{value = +15, type = kCFNumberSInt32Type}
        9 : <CFString 0x3a6dfa5c [0x383e8174]>{contents = "AP_MODE"} = <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        10 : <CFString 0x3a6df9ec [0x383e8174]>{contents = "SSID"} = <CFData 0x105ea0 [0x383e8174]>{length = 9, capacity = 9, bytes = 0x477265656e77617665}
        12 : <CFString 0x3a6df9bc [0x383e8174]>{contents = "CHANNEL"} = <CFNumber 0x104f80 [0x383e8174]>{value = +11, type = kCFNumberSInt32Type}
        13 : <CFString 0x3a6dfa3c [0x383e8174]>{contents = "CHANNEL_FLAGS"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
        14 : <CFString 0x3a6dfa4c [0x383e8174]>{contents = "BEACON_INT"} = <CFNumber 0x104e20 [0x383e8174]>{value = +10, type = kCFNumberSInt32Type}
        16 : <CFString 0x3a6dfa2c [0x383e8174]>{contents = "CAPABILITIES"} = <CFNumber 0x105f40 [0x383e8174]>{value = +33, type = kCFNumberSInt32Type}
        17 : <CFString 0x3a6dfa6c [0x383e8174]>{contents = "scanWasDirected"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        21 : <CFString 0x3a6dfa0c [0x383e8174]>{contents = "BSSID"} = <CFString 0x1060d0 [0x383e8174]>{contents = "0:40:96:45:af:b"}
        24 : <CFString 0x3a6dfa8c [0x383e8174]>{contents = "RATES"} = <CFArray 0x106120 [0x383e8174]>{type = mutable-small, count = 4, values = (
        0 : <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        1 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        2 : <CFNumber 0x104f50 [0x383e8174]>{value = +5, type = kCFNumberSInt32Type}
        3 : <CFNumber 0x104f80 [0x383e8174]>{value = +11, type = kCFNumberSInt32Type}
)}
        27 : <CFString 0x3a6dfa7c [0x383e8174]>{contents = "HIDDEN_NETWORK"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        28 : <CFString 0x3a6dfa9c [0x383e8174]>{contents = "AGE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
        31 : <CFString 0x3a6df97c [0x383e8174]>{contents = "NOISE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
)}
        6 : <CFDictionary 0x106140 [0x383e8174]>{type = mutable, count = 15, capacity = 24, pairs = (
        2 : <CFString 0x3a6df9fc [0x383e8174]>{contents = "SSID_STR"} = <CFString 0x106100 [0x383e8174]>{contents = "07B405759881"}
        7 : <CFString 0x3a6dfa1c [0x383e8174]>{contents = "WEP"} = <CFBoolean 0x383e8388 [0x383e8174]>{value = true}
        8 : <CFString 0x3a6df9ac [0x383e8174]>{contents = "RSSI"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
        9 : <CFString 0x3a6dfa5c [0x383e8174]>{contents = "AP_MODE"} = <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        10 : <CFString 0x3a6df9ec [0x383e8174]>{contents = "SSID"} = <CFData 0x106180 [0x383e8174]>{length = 12, capacity = 12, bytes = 0x303742343035373539383831}
        12 : <CFString 0x3a6df9bc [0x383e8174]>{contents = "CHANNEL"} = <CFNumber 0x104f60 [0x383e8174]>{value = +6, type = kCFNumberSInt32Type}
        13 : <CFString 0x3a6dfa3c [0x383e8174]>{contents = "CHANNEL_FLAGS"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
        14 : <CFString 0x3a6dfa4c [0x383e8174]>{contents = "BEACON_INT"} = <CFNumber 0x104e20 [0x383e8174]>{value = +10, type = kCFNumberSInt32Type}
        16 : <CFString 0x3a6dfa2c [0x383e8174]>{contents = "CAPABILITIES"} = <CFNumber 0x106360 [0x383e8174]>{value = +1137, type = kCFNumberSInt32Type}
        17 : <CFString 0x3a6dfa6c [0x383e8174]>{contents = "scanWasDirected"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        21 : <CFString 0x3a6dfa0c [0x383e8174]>{contents = "BSSID"} = <CFString 0x106340 [0x383e8174]>{contents = "0:12:e:7a:79:9b"}
        24 : <CFString 0x3a6dfa8c [0x383e8174]>{contents = "RATES"} = <CFArray 0x106390 [0x383e8174]>{type = mutable-small, count = 13, values = (
        0 : <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        1 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        2 : <CFNumber 0x104f50 [0x383e8174]>{value = +5, type = kCFNumberSInt32Type}
        3 : <CFNumber 0x104f80 [0x383e8174]>{value = +11, type = kCFNumberSInt32Type}
        4 : <CFNumber 0x105ed0 [0x383e8174]>{value = +22, type = kCFNumberSInt32Type}
        5 : <CFNumber 0x104f60 [0x383e8174]>{value = +6, type = kCFNumberSInt32Type}
        6 : <CFNumber 0x104f70 [0x383e8174]>{value = +9, type = kCFNumberSInt32Type}
        7 : <CFNumber 0x104e50 [0x383e8174]>{value = +12, type = kCFNumberSInt32Type}
        8 : <CFNumber 0x106370 [0x383e8174]>{value = +18, type = kCFNumberSInt32Type}
        9 : <CFNumber 0x106380 [0x383e8174]>{value = +24, type = kCFNumberSInt32Type}
        10 : <CFNumber 0x106480 [0x383e8174]>{value = +36, type = kCFNumberSInt32Type}
        11 : <CFNumber 0x106490 [0x383e8174]>{value = +48, type = kCFNumberSInt32Type}
        12 : <CFNumber 0x1064a0 [0x383e8174]>{value = +54, type = kCFNumberSInt32Type}
)}
        27 : <CFString 0x3a6dfa7c [0x383e8174]>{contents = "HIDDEN_NETWORK"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        28 : <CFString 0x3a6dfa9c [0x383e8174]>{contents = "AGE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
        31 : <CFString 0x3a6df97c [0x383e8174]>{contents = "NOISE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
)}
        7 : <CFDictionary 0x1063f0 [0x383e8174]>{type = mutable, count = 14, capacity = 24, pairs = (
        2 : <CFString 0x3a6df9fc [0x383e8174]>{contents = "SSID_STR"} = <CFString 0x105750 [0x383e8174]>{contents = "Greenwave"}
        8 : <CFString 0x3a6df9ac [0x383e8174]>{contents = "RSSI"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
        9 : <CFString 0x3a6dfa5c [0x383e8174]>{contents = "AP_MODE"} = <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        10 : <CFString 0x3a6df9ec [0x383e8174]>{contents = "SSID"} = <CFData 0x1063b0 [0x383e8174]>{length = 9, capacity = 9, bytes = 0x477265656e77617665}
        12 : <CFString 0x3a6df9bc [0x383e8174]>{contents = "CHANNEL"} = <CFNumber 0x104f60 [0x383e8174]>{value = +6, type = kCFNumberSInt32Type}
        13 : <CFString 0x3a6dfa3c [0x383e8174]>{contents = "CHANNEL_FLAGS"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
        14 : <CFString 0x3a6dfa4c [0x383e8174]>{contents = "BEACON_INT"} = <CFNumber 0x104e20 [0x383e8174]>{value = +10, type = kCFNumberSInt32Type}
        16 : <CFString 0x3a6dfa2c [0x383e8174]>{contents = "CAPABILITIES"} = <CFNumber 0x105770 [0x383e8174]>{value = +33, type = kCFNumberSInt32Type}
        17 : <CFString 0x3a6dfa6c [0x383e8174]>{contents = "scanWasDirected"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        21 : <CFString 0x3a6dfa0c [0x383e8174]>{contents = "BSSID"} = <CFString 0x1065b0 [0x383e8174]>{contents = "0:40:96:57:d3:4"}
        24 : <CFString 0x3a6dfa8c [0x383e8174]>{contents = "RATES"} = <CFArray 0x1065f0 [0x383e8174]>{type = mutable-small, count = 4, values = (
        0 : <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        1 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        2 : <CFNumber 0x104f50 [0x383e8174]>{value = +5, type = kCFNumberSInt32Type}
        3 : <CFNumber 0x104f80 [0x383e8174]>{value = +11, type = kCFNumberSInt32Type}
)}
        27 : <CFString 0x3a6dfa7c [0x383e8174]>{contents = "HIDDEN_NETWORK"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        28 : <CFString 0x3a6dfa9c [0x383e8174]>{contents = "AGE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
        31 : <CFString 0x3a6df97c [0x383e8174]>{contents = "NOISE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
)}
        8 : <CFDictionary 0x106650 [0x383e8174]>{type = mutable, count = 16, capacity = 24, pairs = (
        2 : <CFString 0x3a6df9fc [0x383e8174]>{contents = "SSID_STR"} = <CFString 0x383edf38 [0x383e8174]>{contents = ""}
        8 : <CFString 0x3a6df9ac [0x383e8174]>{contents = "RSSI"} = <CFNumber 0x104f60 [0x383e8174]>{value = +6, type = kCFNumberSInt32Type}
        9 : <CFString 0x3a6dfa5c [0x383e8174]>{contents = "AP_MODE"} = <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        10 : <CFString 0x3a6df9ec [0x383e8174]>{contents = "SSID"} = <CFData 0x106610 [0x383e8174]>{length = 0, capacity = 0, bytes = 0x}
        11 : <CFString 0x3a6dff1c [0x383e8174]>{contents = "WPA_IE"} = <CFDictionary 0x106840 [0x383e8174]>{type = mutable, count = 4, capacity = 6, pairs = (
        0 : <CFString 0x3a6dfeec [0x383e8174]>{contents = "IE_KEY_WPA_UCIPHERS"} = <CFArray 0x106800 [0x383e8174]>{type = mutable-small, count = 1, values = (
        0 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
)}
        1 : <CFString 0x3a6dfedc [0x383e8174]>{contents = "IE_KEY_WPA_MCIPHER"} = <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        3 : <CFString 0x3a6dfefc [0x383e8174]>{contents = "IE_KEY_WPA_AUTHSELS"} = <CFArray 0x106a20 [0x383e8174]>{type = mutable-small, count = 1, values = (
        0 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
)}
        4 : <CFString 0x3a6dff0c [0x383e8174]>{contents = "IE_KEY_WPA_VERSION"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
)}
        12 : <CFString 0x3a6df9bc [0x383e8174]>{contents = "CHANNEL"} = <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        13 : <CFString 0x3a6dfa3c [0x383e8174]>{contents = "CHANNEL_FLAGS"} = <CFNumber 0x104bc0 [0x383e8174]>{value = +8, type = kCFNumberSInt32Type}
        14 : <CFString 0x3a6dfa4c [0x383e8174]>{contents = "BEACON_INT"} = <CFNumber 0x104e20 [0x383e8174]>{value = +10, type = kCFNumberSInt32Type}
        16 : <CFString 0x3a6dfa2c [0x383e8174]>{contents = "CAPABILITIES"} = <CFNumber 0x1063e0 [0x383e8174]>{value = +1041, type = kCFNumberSInt32Type}
        17 : <CFString 0x3a6dfa6c [0x383e8174]>{contents = "scanWasDirected"} = <CFBoolean 0x383e8380 [0x383e8174]>{value = false}
        18 : <CFString 0x3a6dfaac [0x383e8174]>{contents = "IE"} = <CFData 0x106aa0 [0x383e8174]>{length = 32, capacity = 32, bytes = 0xdd06001018010000dd160050f2010100 ... f20201000050f202}
        21 : <CFString 0x3a6dfa0c [0x383e8174]>{contents = "BSSID"} = <CFString 0x1065d0 [0x383e8174]>{contents = "0:11:50:f:a8:b7"}
        24 : <CFString 0x3a6dfa8c [0x383e8174]>{contents = "RATES"} = <CFArray 0x1067e0 [0x383e8174]>{type = mutable-small, count = 12, values = (
        0 : <CFNumber 0x104a80 [0x383e8174]>{value = +1, type = kCFNumberSInt32Type}
        1 : <CFNumber 0x104e10 [0x383e8174]>{value = +2, type = kCFNumberSInt32Type}
        2 : <CFNumber 0x104f50 [0x383e8174]>{value = +5, type = kCFNumberSInt32Type}
        3 : <CFNumber 0x104f80 [0x383e8174]>{value = +11, type = kCFNumberSInt32Type}
        4 : <CFNumber 0x106640 [0x383e8174]>{value = +18, type = kCFNumberSInt32Type}
        5 : <CFNumber 0x1068b0 [0x383e8174]>{value = +24, type = kCFNumberSInt32Type}
        6 : <CFNumber 0x1067c0 [0x383e8174]>{value = +36, type = kCFNumberSInt32Type}
        7 : <CFNumber 0x1067d0 [0x383e8174]>{value = +54, type = kCFNumberSInt32Type}
        8 : <CFNumber 0x104f60 [0x383e8174]>{value = +6, type = kCFNumberSInt32Type}
        9 : <CFNumber 0x104f70 [0x383e8174]>{value = +9, type = kCFNumberSInt32Type}
        10 : <CFNumber 0x104e50 [0x383e8174]>{value = +12, type = kCFNumberSInt32Type}
        11 : <CFNumber 0x106910 [0x383e8174]>{value = +48, type = kCFNumberSInt32Type}
)}
        27 : <CFString 0x3a6dfa7c [0x383e8174]>{contents = "HIDDEN_NETWORK"} = <CFBoolean 0x383e8388 [0x383e8174]>{value = true}
        28 : <CFString 0x3a6dfa9c [0x383e8174]>{contents = "AGE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
        31 : <CFString 0x3a6df97c [0x383e8174]>{contents = "NOISE"} = <CFNumber 0x104e30 [0x383e8174]>{value = +0, type = kCFNumberSInt32Type}
)}
)}
```