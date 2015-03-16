## Preferences ##

```
POWERSAVE
TXPOWER
STATE
PHY_MODE
OP_MODE
NOISE
RATE
POWER
RSSI
CHANNEL
AUTH_TYPE
PROTMODE
SSID
SSID_STR
BSSID
CAPABILITIES
CHANNEL_FLAGS
BEACON_INT
AP_MODE
RATES
SCAN_BSS_TYPE
SCAN_TYPE
SCAN_PHY_MODE
SCAN_DWELL_TIME
SCAN_REST_TIME
SCAN_CHANNELS
SCAN_MERGE
SCAN_FLAGS
SCAN_RSSI_THRESHOLD
SCAN_NUM_SCANS
0123456789abcdefABCDEF
RSN_IE
IE_KEY_RSN_MCIPHER
IE_KEY_RSN_UCIPHERS
AUTH_SEL_OVERRIDE
IE_KEY_RSN_AUTHSELS
WPA_IE
IE_KEY_WPA_MCIPHER
IE_KEY_WPA_UCIPHERS
IE_KEY_WPA_AUTHSELS
ASSOC_FLAGS
WEPType
SUP_CHANNEL
SUP_CHANNEL_FLAGS
PROTMODE_THRESHOLD
AUTH_LOWER
AUTH_UPPER
RATESET_RATE
RATESET_FLAGS
STATION_MAC
STATION_RSSI
STATS_TX_FRAME_COUNT
STATS_TX_ERRORS
STATS_RX_FRAME_COUNT
STATS_RX_ERRORS
DEAUTH_REASON
DEAUTH_EA
LAST_RX_RATE
LAST_RX_RSSI
LAST_RX_NUM_STREAMS
LAST_RX_SA
COUNT
MAX_FACTOR
MAX_DENSITY
IMMEDIATE_BA
CCBA
IMPLICIT_BA
MODE
SUBMODE
FLAGS
RSSI_CTL_AGR
RSSI_CTL_LIST
RSSI_EXT_AGR
RSSI_EXT_LIST
RSSI_UNIT
NOISE_CTL_AGR
NOISE_CTL_LIST
NOISE_EXT_AGR
NOISE_EXT_LIST
NOISE_UNIT
PHYMODE_SUPPORTED
PHYMODE_ACTIVE
AP_MODE_AUTH_LOWER
AP_MODE_AUTH_UPPER
AP_MODE_CYPHER_TYPE
AP_MODE_KEY
/dev/%s
IE_KEY_WPA_VERSION
IE_KEY_RSN_VERSION
APPLE_IE_VERSION
APPLE_IE_PRODUCT_ID
APPLE_IE_INT_MIT
APPLE_IE_UNCONFIGURED
APPLE_IE_WSC_CAP
APPLE_IE_WSC_ACTIVE
APPLE_IE
IE_KEY_80211D_FIRST_CHANNEL
IE_KEY_80211D_NUM_CHANNELS
IE_KEY_80211D_MAX_POWER
IE_KEY_80211D_COUNTRY_CODE
IE_KEY_80211D_CHAN_INFO_ARRAY
80211D_IE
IE_KEY_SES_VERSION
IE_KEY_SES_RWO
IE_KEY_SES_WDS_RWO
SES_IE
```

## Aeropuerto ##
```
WiFi: scSetConfigurationValue(): SCPreferencesLock() %s
WiFi: scSetConfigurationValue(): SCPreferencesApplyChanges() %s
WiFi: scSetConfigurationValue(): SCPreferencesCommitChanges() %s
WiFi: scSetConfigurationValue(): SCPreferencesSetValue() %s
WiFi: scGetConfigurationValue(): SCPreferencesLock() %s
WiFi: dispatchEvent(): mach_msg_send() failed: %s
WiFi: scDynamicStoreNotifcationCallback(): couldn't send event (%@)
WiFi: scPreferencesNotifcationCallback(): couldn't send event (%@)
IOService
BSD Name
IOGeneralInterest
IO80211Controller
WiFi: ioPublishedDriverCallback(): IORegistryEntrySearchCFProperty for %s failed
WiFi: ioPublishedDriverCallback(): IORegistryEntryCreateCFProperties failed %d
WiFi: ioPublishedDriverCallback(): Device %@ already registered.
WiFi: ioPublishedDriverCallback(): IOServiceAddInterestNotification() = %d
WiFi: ioPublishedDriverCallback(): Not an 80211Controller interface.
WiFi: Apple80211Open failed (%x)
WiFi: initApple80211Ref failed (%d)
WiFi: initApple80211Notifications(): Apple80211EventMonitoringInit failed (%d)
WiFi: initApple80211Notifications(): registration for APPLE80211_M_POWER_CHANGED failed (%x)
WiFi: initApple80211Notifications(): registration for APPLE80211_M_SSID_CHANGED failed (%x)
WiFi: initApple80211Notifications(): registration for APPLE80211_M_BSSID_CHANGED failed (%x)
WiFi: initApple80211Notifications(): registration for APPLE80211_M_LINK_CHANGED failed (%x)
WiFi: initApple80211Notifications(): registration for APPLE80211_M_MIC_ERROR_UCAST failed (%x)
WiFi: initApple80211Notifications(): registration for APPLE80211_M_MIC_ERROR_MCAST failed (%x)
WiFi: initApple80211Notifications(): registration for APPLE80211_M_INT_MIT_CHANGED failed (%x)
WiFi: initApple80211Notifications(): registration for APPLE80211_M_MODE_CHANGED failed (%x)
WiFi: ioPublishedDriverCallback(): BSD driver init failed.
WiFi: ioPublishedDriverCallback() couldn't send event (%@)
com.apple.airport.userNotification
com.apple.iokit.hid.displayStatus
CAPABILITIES
WiFi: compareDictionaryValues(): at least one argument is NULL!
WiFi: compareDictionaryValues(): can't compare different types
RSSI
SCAN_MERGE
SCAN_TYPE
SCAN_BSS_TYPE
SCAN_CHANNELS
WiFi: Determining scan regions.
CHANNEL
WiFi: Region = Japan
WiFi: Passive Scan failed: %d
WiFi: Region = Europe
WiFi: Region = North America
SSID_STR
AirPort
IE_KEY_RSN_AUTHSELS
IE_KEY_WPA_AUTHSELS
WPA_IE
RSN_IE
AP_MODE
BSSID
List of known networks
isValid
initEventHandler
/SourceCache/AirPort/AirPort-53/Apple80211/embeddedConfigd/embeddedConfigdMain.c
KERN_SUCCESS == ret
!pthread_attr_init(&attr)
!pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED)
!pthread_create( &tid, &attr, eventHandlerThread, NULL)
!pthread_attr_destroy(&attr)
IOServiceFirstMatch
CHANNEL_FLAGS
Embedded AirPort plug-in
com.apple.wifi.plist
WiFi: initSCNotifications(): SCDynamicStoreCreate() failed
WiFi: initSCNotifications(): SCDynamicStoreSetNotificationKeys() failed
WiFi: initSCNotifications(): SCDynamicStoreCreateRunLoopSource() failed
WiFi: initSystemConfiguration(): AirPort could not initialize SystemConfiguration.
WiFi: Could not initialize System Configuration
WiFi: Could not initialize IOKit callbacks
Always remember new networks
WiFi: createKnownNetworkEntryMutable() failed; missing APPLE80211KEY_SSID_STR
SecurityType
WPA Personal
WPA2 Personal
WiFi: updateNetworkList(): item with index %d matches
WiFi: No password found for %s network %@
WiFi: Join failed: %@ - %d
ASSOC_FLAGS
WiFi: Attempting to join: %@
WiFi: Join timed out. Trying again.: %@ - %d 
WiFi: performAssociationWithOptions(): attempted ssid=%@ password=%@ err=%d
WiFi: Joined: %@
Custom network settings
WiFi: scSetCurrentNetworkSet(): SCPreferencesLock() %s
Automatic
WiFi: scSetCurrentNetworkSet(): SCPreferencesApplyChanges() %s
WiFi: scSetCurrentNetworkSet(): SCPreferencesCommitChanges() %s
com.apple.configd.aeropuerto
Aeropuerto
WIFI_PASSWORD_TITLE
WIFI_PASSWORD_MESSAGE
WIFI_JOIN
WIFI_CANCEL
com.apple.airport.findOpenNetwork.port
com.apple.airport.findOpenNetwork
SignalStrengthThreshold
%@, 
WiFi: Directed Scan for %@ failed: %d
WiFi: ajPerform(): preventAutoJoinFlags=%d
WiFi: ajPerform(): AirPort interface %@ not active!!
SCAN_FLAGS
SCAN_RSSI_THRESHOLD
WiFi: Scan failed: %d
WiFi: Scan found: %@
scanWasDirected
SSID
SCAN_NUM_SCANS
SCAN_PHY_MODE
WiFi: Direct scan found: %@
WiFi: ajPostFindOpenNetworkNotification: undefined bootstrap error
WiFi: Waiting for user to select open network
WiFi: ajPostFindOpenNetworkNotification: BOOTSTRAP_NOT_PRIVILIGED
WiFi: ajPostFindOpenNetworkNotification: BOOTSTRAP_SERVICE_ACTIVE
Fallback Preference
%@/%@/%@/
WiFi: handleSCDynamicStoreEvent(): changedKeys=%@
WiFi: handleSCDynamicStoreEvent(): setupPrefix=%@
WiFi: handleSCDynamicStoreEvent(): STATE: currentKey = %@
WiFi: handleSCDynamicStoreEvent(): interfaceName=%@
alwaysScan
WiFi: Device powering %s
AllowEnable
WiFi: handleIOKitEvent(): Apple80211GetPower = %d
WiFi: Device power = %s and prefences power = %s.  Setting device power to %s
WiFi: handleIOKitEvent(): Apple80211SetPower err = %d
WiFi: handleEvent(): EventType=%d not supported. value = %@
WiFi: User has canceled Auto Join
WiFi: User has canceled password entry
```