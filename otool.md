#Interesting otool information from various system components using wireless calls.

# Introduction #

This page contains interesting information gleaned with otool from the various system components which appear to use wireless calls.

  * Aeropuerto
  * AirPortSettings
  * MobileMail
  * Preferences
  * SpringBoard


# Details #

## Aeropuerto ##
```
# otool -vVt /System/Library/SystemConfiguration/Aeropuerto.bundle/Aeropuerto | grep -e "Apple\|Air\|80211\|IEEE"      
000017fc        eb0015c0        bl _Apple80211Close
00001b58        e59f202c        ldr r2, [pc, #44]       ;[0x00001b8c] = 0x0001c600 (@ "d; missing APPLE80211KEY_SSID_STR")
00001e9c        eb0013bc        bl _Apple80211Open
00001ed4        eb001534        bl _Apple80211BindToInterface
00001ee4        eb001406        bl _Apple80211Close
00001ef8        eb001756        bl _Apple80211GetPower
00001f38        eb0050fb        bl _Apple80211EventMonitoringInit
00001f60        eb00520e        bl _Apple80211StartMonitoringEvent
00001f88        eb005204        bl _Apple80211StartMonitoringEvent
00001fb0        eb0051fa        bl _Apple80211StartMonitoringEvent
00001fd8        eb0051f0        bl _Apple80211StartMonitoringEvent
00002000        eb0051e6        bl _Apple80211StartMonitoringEvent
00002028        eb0051dc        bl _Apple80211StartMonitoringEvent
00002050        eb0051d2        bl _Apple80211StartMonitoringEvent
00002078        eb0051c8        bl _Apple80211StartMonitoringEvent
000025d0        e59f1048        ldr r1, [pc, #72]       ;[0x00002620] = 0x0001bcdc (@ "Notifications(): Apple80211EventMonitoringInit failed (%d)")
00002648        e59f00c0        ldr r0, [pc, #192]      ;[0x00002710] = 0x0001cccc (@ ": Apple80211GetPower = %d")
00002b1c        eb001d30        bl _Apple80211Scan
00002cf0        e59f30e8        ldr r3, [pc, #232]      ;[0x00002de0] = 0x0001c5f0 (@ "yMutable() failed; missing APPLE80211KEY_SSID_STR")
00002d14        e59f20cc        ldr r2, [pc, #204]      ;[0x00002de8] = 0x0001c5f0 (@ "yMutable() failed; missing APPLE80211KEY_SSID_STR")
00002d30        e59f10b4        ldr r1, [pc, #180]      ;[0x00002dec] = 0x0001c604 (@ "issing APPLE80211KEY_SSID_STR")
00002d4c        e59f10a0        ldr r1, [pc, #160]      ;[0x00002df4] = 0x0001c5f4 (@ "able() failed; missing APPLE80211KEY_SSID_STR")
00003378        e59f0050        ldr r0, [pc, #80]       ;[0x000033d0] = 0x0001bf68 (@ "fications(): registration for APPLE80211_M_INT_MIT_CHANGED failed (%x)")
00003384        e59f2048        ldr r2, [pc, #72]       ;[0x000033d4] = 0x0001bf88 (@ "PLE80211_M_INT_MIT_CHANGED failed (%x)")
00003408        e59f20c8        ldr r2, [pc, #200]      ;[0x000034d8] = 0x0001befc (@ "ple80211Notifications(): registration for APPLE80211_M_MIC_ERROR_MCAST failed (%x)")
000034ec        e59f3a1c        ldr r3, [pc, #2588]     ;[0x00003f10] = 0x0001bdf0 (@ "tions(): registration for APPLE80211_M_BSSID_CHANGED failed (%x)")
000034fc        e59f2a10        ldr r2, [pc, #2576]     ;[0x00003f14] = 0x0001be00 (@ "ation for APPLE80211_M_BSSID_CHANGED failed (%x)")
00003534        e59f29e0        ldr r2, [pc, #2528]     ;[0x00003f1c] = 0x0001bdd8 (@ ": initApple80211Notifications(): registration for APPLE80211_M_BSSID_CHANGED failed (%x)")
00003578        e59f89b0        ldr r8, [pc, #2480]     ;[0x00003f30] = 0x0001bde4 (@ "0211Notifications(): registration for APPLE80211_M_BSSID_CHANGED failed (%x)")
00003634        e59f0900        ldr r0, [pc, #2304]     ;[0x00003f3c] = 0x0001bcac (@ "itApple80211Ref failed (%d)")
00003638        e59f2900        ldr r2, [pc, #2304]     ;[0x00003f40] = 0x0001bccc (@ ": initApple80211Notifications(): Apple80211EventMonitoringInit failed (%d)")
00003650        e59f38ec        ldr r3, [pc, #2284]     ;[0x00003f44] = 0x0001bd18 (@ "WiFi: initApple80211Notifications(): registration for APPLE80211_M_POWER_CHANGED failed (%x)")
00003680        e59f88cc        ldr r8, [pc, #2252]     ;[0x00003f54] = 0x0001bcdc (@ "Notifications(): Apple80211EventMonitoringInit failed (%d)")
000036a0        e59fc8b0        ldr r12, [pc, #2224]    ;[0x00003f58] = 0x0001bc48 (@ "dDriverCallback(): Not an 80211Controller interface.")
000045ec        eb002359        bl _Apple80211Associate
0000514c        eb0035df        bl _Apple80211CopyValue
00005398        eb001311        bl _Apple80211Scan
00005754        eb001222        bl _Apple80211Scan
000064bc        eb0005e5        bl _Apple80211GetPower
0000659c        eb0030cb        bl _Apple80211CopyValue
00006740        eb000544        bl _Apple80211GetPower
000067c0        eb000567        bl _Apple80211SetPower
_Apple80211Open:
_Apple80211Close:
00006f74        eb003e93        bl _Apple80211EventMonitoringHalt
_Apple80211GetIfListCopy:
_Apple80211BindToInterface:
00007428        ebfffeda        bl _Apple80211GetIfListCopy
00007514        eb003d2b        bl _Apple80211EventMonitoringHalt
_Apple80211GetInterfaceNameCopy:
_Apple80211GetInfoCopy:
00007724        eb002c69        bl _Apple80211CopyValue
00007888        eb002c10        bl _Apple80211CopyValue
00007910        eb002bee        bl _Apple80211CopyValue
00007970        eb002bd6        bl _Apple80211CopyValue
000079d0        eb002bbe        bl _Apple80211CopyValue
00007a30        eb002ba6        bl _Apple80211CopyValue
00007a90        eb002b8e        bl _Apple80211CopyValue
00007b4c        eb002b5f        bl _Apple80211CopyValue
_Apple80211GetPower:
00007c84        eb002b11        bl _Apple80211CopyValue
_Apple80211SetPower:
00007da8        eb002ac8        bl _Apple80211CopyValue
00007ee0        eb002eb6        bl _Apple80211Set
00007ffc        eb003c87        bl _Apple80211ParseWPAIE
0000803c        eb003eab        bl _Apple80211ParseRSNIE
00008ac4        eb003c54        bl _Apple80211ParseAppleIE
00008b08        eb003e86        bl _Apple80211Parse80211dIE
00008b4c        eb003ef5        bl _Apple80211ParseSES_IE
_Apple80211Scan:
_Apple80211ScanAsync:
_Apple80211ScanDynamic:
0000bed0        eb00375d        bl _IEEE80211iPasswordHash
_Apple80211Associate:
0000dcc4        eb00173d        bl _Apple80211Set
_Apple80211Get:
_Apple80211CopyValue:
00012f64        ebffec3d        bl _Apple80211Get
00013024        ebffec0d        bl _Apple80211Get
000130f0        ebffebda        bl _Apple80211Get
000131a0        ebffebae        bl _Apple80211Get
000132d0        ebffeb62        bl _Apple80211Get
_Apple80211Set:
0001622c        ebffd0e9        bl _Apple80211ScanAsync
_Apple80211EventMonitoringInit:
000163d8        eb00017a        bl _Apple80211EventMonitoringHalt
_Apple80211StartMonitoringEvent:
_Apple80211StopMonitoringEvent:
_Apple80211EventMonitoringHalt:
_Apple80211ParseWPAIE:
_Apple80211ParseRSNIE:
_Apple80211ParseAppleIE:
_Apple80211Parse80211dIE:
_Apple80211ParseSES_IE:
_IEEE80211iPasswordHash:

```

## AirPortSettings ##

```
# otool -vVt /System/Library/PreferenceBundles/AirPortSettings.bundle/AirPortSettings|grep -e "Apple\|Air\|80211\|IEEE"
/System/Library/PreferenceBundles/AirPortSettings.bundle/AirPortSettings:
000019bc        e59f2268        ldr r2, [pc, #616]      ;[0x00001c2c] = 0x00017654 (@ ": Apple80211BindToInterface failed, error: %d")
000019e8        e59f2240        ldr r2, [pc, #576]      ;[0x00001c30] = 0x00017638 (@ "LE80211_M_POWER_CHANGED")
00001a1c        e59f4218        ldr r4, [pc, #536]      ;[0x00001c3c] = 0x000175e4 (@ " %d, APPLE80211_M_LINK_CHANGED")
00001a78        e59f21d0        ldr r2, [pc, #464]      ;[0x00001c50] = 0x000175b8 (@ "WiFi: Apple80211StartMonitoringEvent failed: %d, APPLE80211_M_LINK_CHANGED")
00001abc        e59f2190        ldr r2, [pc, #400]      ;[0x00001c54] = 0x00017584 (@ "itoringEvent failed: %d, APPLE80211_M_ASSOC_DONE")
00001b04        e59f2150        ldr r2, [pc, #336]      ;[0x00001c5c] = 0x0001754c (@ "led: %d, APPLE80211_M_SCAN_DONE")
0000231c        e59f1080        ldr r1, [pc, #128]      ;[0x000023a4] = _Apple80211GetIfListCopy
0000232c        e59f1074        ldr r1, [pc, #116]      ;[0x000023a8] = _Apple80211CopyValue
0000246c        e59f1034        ldr r1, [pc, #52]       ;[0x000024a8] = _Apple80211Set
00002478        e59f102c        ldr r1, [pc, #44]       ;[0x000024ac] = _Apple80211SetPower
000024b4        e59f1018        ldr r1, [pc, #24]       ;[0x000024d4] = _Apple80211GetPower
0000264c        e59f1018        ldr r1, [pc, #24]       ;[0x0000266c] = _Apple80211ScanAsync
00002670        e59f1014        ldr r1, [pc, #20]       ;[0x0000268c] = _Apple80211Associate
000027dc        e59f1014        ldr r1, [pc, #20]       ;[0x000027f8] = _CTPowerGetAirplaneMode
00003c28        e59f13c0        ldr r1, [pc, #960]      ;[0x00003ff0] = 0x00017654 (@ ": Apple80211BindToInterface failed, error: %d")
00003d50        e59f12bc        ldr r1, [pc, #700]      ;[0x00004014] = 0x0001752c (@ "ple80211StartMonitoringEvent failed: %d, APPLE80211_M_SCAN_DONE")
00003d68        e59f12a8        ldr r1, [pc, #680]      ;[0x00004018] = 0x00017608 (@ ": Apple80211StartMonitoringEvent failed: %d, APPLE80211_M_POWER_CHANGED")
00003dc8        e59f1250        ldr r1, [pc, #592]      ;[0x00004020] = 0x00017658 (@ "ple80211BindToInterface failed, error: %d")
00003e0c        e59f121c        ldr r1, [pc, #540]      ;[0x00004030] = 0x00017578 (@ "0211StartMonitoringEvent failed: %d, APPLE80211_M_ASSOC_DONE")
00003e44        e59f51f0        ldr r5, [pc, #496]      ;[0x0000403c] = 0x000175e8 (@ " APPLE80211_M_LINK_CHANGED")
00003eb8        e59f1188        ldr r1, [pc, #392]      ;[0x00004048] = 0x00017578 (@ "0211StartMonitoringEvent failed: %d, APPLE80211_M_ASSOC_DONE")
00003ee8        e59f115c        ldr r1, [pc, #348]      ;[0x0000404c] = 0x00017538 (@ "tMonitoringEvent failed: %d, APPLE80211_M_SCAN_DONE")
00004278        e59f0798        ldr r0, [pc, #1944]     ;[0x00004a18] = 0x00017604 (@ "WiFi: Apple80211StartMonitoringEvent failed: %d, APPLE80211_M_POWER_CHANGED")
000042d0        e59f0754        ldr r0, [pc, #1876]     ;[0x00004a2c] = 0x00017574 (@ "ple80211StartMonitoringEvent failed: %d, APPLE80211_M_ASSOC_DONE")
00004730        e59f63b0        ldr r6, [pc, #944]      ;[0x00004ae8] = 0x00016b4c (@ "pple80211=}")
00004880        e59f129c        ldr r1, [pc, #668]      ;[0x00004b24] = 0x00016b50 (@ "80211=}")
00004c1c        e59f1140        ldr r1, [pc, #320]      ;[0x00004d64] = 0x0001675c (@ "AirplaneMode:")
0000520c        eb004e67        bl _CTPowerGetAirplaneMode
0000950c        eb003dd7        bl _Apple80211Open
00009540        eb003ea2        bl _Apple80211GetIfListCopy
00009590        eb003e46        bl _Apple80211BindToInterface
000095ac        eb003e77        bl _Apple80211EventMonitoringInit
000095b8        eb003e2c        bl _Apple80211StartMonitoringEvent
000095d8        eb003e24        bl _Apple80211StartMonitoringEvent
000095f8        eb003e1c        bl _Apple80211StartMonitoringEvent
00009618        eb003e14        bl _Apple80211StartMonitoringEvent
00009644        eb003de9        bl _Apple80211Close
00009664        eb003de1        bl _Apple80211Close
00009900        eb003cf6        bl _Apple80211ScanAsync
00009a10        eb003ca2        bl _Apple80211EventMonitoringHalt
00009a18        eb003cf4        bl _Apple80211Close
00009b74        eb003c35        bl _Apple80211GetInfoCopy
00009c64        eb003bf9        bl _Apple80211GetInfoCopy
00009e00        eb003c12        bl _Apple80211GetPower
00009e68        eb003c54        bl _Apple80211CopyValue
00009ef0        eb003be2        bl _Apple80211SetPower
0000a5ac        eb0039c7        bl _Apple80211Associate
0000ab48        eb0038d4        bl _Apple80211Set
0000c3b0        eb00324a        bl _Apple80211ScanAsync
0000d49c        eb002deb        bl _Apple80211GetInfoCopy
0000d60c        eb002d8f        bl _Apple80211GetInfoCopy
```

## MobileMail ##

```
# otool -vtV /Applications/MobileMail.app/MobileMail | grep -e "Apple\|Air\|80211\|IEEE"
0001db0c        eb00bc33        bl _CTPowerGetAirplaneMode
00039654        eb004e39        bl _Apple80211Open
00039800        eb004def        bl _Apple80211Close
0003a4ac        eb004ac1        bl _Apple80211GetPower

```

## Preferenes ##

```
# otool -vtT /System/Library/Frameworks/Preferences.framework/Preferences|grep -e "Apple\|Air\|80211\|IEEE"
single module    _Apple80211Associate
single module    _Apple80211BindToInterface
single module    _Apple80211Close
single module    _Apple80211CopyValue
single module    _Apple80211EventMonitoringHalt
single module    _Apple80211EventMonitoringInit
single module    _Apple80211Get
single module    _Apple80211GetIfListCopy
single module    _Apple80211GetInfoCopy
single module    _Apple80211GetInterfaceNameCopy
single module    _Apple80211GetPower
single module    _Apple80211Open
single module    _Apple80211Parse80211dIE
single module    _Apple80211ParseAppleIE
single module    _Apple80211ParseRSNIE
single module    _Apple80211ParseSES_IE
single module    _Apple80211ParseWPAIE
single module    _Apple80211Scan
single module    _Apple80211ScanAsync
single module    _Apple80211ScanDynamic
single module    _Apple80211Set
single module    _Apple80211SetPower
single module    _Apple80211StartMonitoringEvent
single module    _Apple80211StopMonitoringEvent
single module    _IEEE80211iPasswordHash
single module    _PSGetAirplaneMode
single module    _PSSetAirplaneMode
_PSGetAirplaneMode:
_PSSetAirplaneMode:
_Apple80211Open:
_Apple80211Close:
_Apple80211GetIfListCopy:
_Apple80211BindToInterface:
_Apple80211GetInterfaceNameCopy:
_Apple80211GetInfoCopy:
_Apple80211GetPower:
_Apple80211SetPower:
_Apple80211Scan:
_Apple80211ScanAsync:
_Apple80211ScanDynamic:
_Apple80211Associate:
_Apple80211Get:
_Apple80211CopyValue:
_Apple80211Set:
_Apple80211EventMonitoringInit:
_Apple80211StartMonitoringEvent:
_Apple80211StopMonitoringEvent:
_Apple80211EventMonitoringHalt:
_Apple80211ParseWPAIE:
_Apple80211ParseRSNIE:
_Apple80211ParseAppleIE:
__build80211dIEDict:
_Apple80211Parse80211dIE:
_Apple80211ParseSES_IE:
_IEEE80211iPasswordHash:
```

## SpringBoard ##

```
# otool -tvV /System/Library/CoreServices/SpringBoard.app/SpringBoard | grep -e "Apple\|Air\|80211\|IEEE"
00017b94        e59f1074        ldr r1, [pc, #116]      ;[0x00017c10] = 0x0008fa78 (@@ "setIsInAirplaneMode:animate:")
0001e3ac        eb019fcb        bl _CTPowerGetAirplaneMode
00024748        eb0186e4        bl _CTPowerGetAirplaneMode
00024764        e59f103c        ldr r1, [pc, #60]       ;[0x000247a8] = 0x0008fe8c (@@ "setAirplaneModeIsEnabled:")
000247b8        e59f1028        ldr r1, [pc, #40]       ;[0x000247e8] = 0x0008fe94 (@@ "updateAirplaneMode")
00024830        e59f1078        ldr r1, [pc, #120]      ;[0x000248b0] = 0x0008fe94 (@@ "updateAirplaneMode")
00026de8        eb017d3c        bl _CTPowerGetAirplaneMode
00027774        e59f3368        ldr r3, [pc, #872]      ;[0x00027ae4] = _kCTPowerAirplaneModeNotification
00028000        e59f00a0        ldr r0, [pc, #160]      ;[0x000280a8] = 0x00090f0c (@@ "SBStatusBarAirPortView")
00028d00        e59f1014        ldr r1, [pc, #20]       ;[0x00028d1c] = 0x0008ff54 (@@ "setAirPortStrength:")
00028d30        e59f1024        ldr r1, [pc, #36]       ;[0x00028d5c] = 0x0008ff58 (@@ "setShowsAirPort:")
000293f4        e59f109c        ldr r1, [pc, #156]      ;[0x00029498] = 0x0008fe8c (@@ "setAirplaneModeIsEnabled:")
00029db0        e59f6044        ldr r6, [pc, #68]       ;[0x00029dfc] = 0x0008ffa0 (@@ "setAirplaneModeIsEnabled:animate:")
00029e3c        e59f1048        ldr r1, [pc, #72]       ;[0x00029e8c] = 0x0008fe8c (@@ "setAirplaneModeIsEnabled:")
00029f40        e59f6028        ldr r6, [pc, #40]       ;[0x00029f70] = 0x0008ff54 (@@ "setAirPortStrength:")
00029fa0        e59f6034        ldr r6, [pc, #52]       ;[0x00029fdc] = 0x0008ff8c (@@ "setShowsAirPort:animate:")
0002be84        e59f13e0        ldr r1, [pc, #992]      ;[0x0002c26c] = 0x0008ff74 (@@ "showsAirPort")
0002c120        e59f1188        ldr r1, [pc, #392]      ;[0x0002c2b0] = 0x0008ff54 (@@ "setAirPortStrength:")
0002c150        e59f1160        ldr r1, [pc, #352]      ;[0x0002c2b8] = 0x0008ff8c (@@ "setShowsAirPort:animate:")
0002c1b8        e59f110c        ldr r1, [pc, #268]      ;[0x0002c2cc] = 0x0008ffa0 (@@ "setAirplaneModeIsEnabled:animate:")
0003f010        eb011cb2        bl _CTPowerGetAirplaneMode
0003f0c0        eb011e06        bl _PSSetAirplaneMode
000525f4        eb00d143        bl _Apple80211Open
00052748        e59f1064        ldr r1, [pc, #100]      ;[0x000527b4] = _kSCPropNetAirPortJoinMode
0005275c        e59f2054        ldr r2, [pc, #84]       ;[0x000527b8] = _kSCValNetAirPortJoinModeAutomatic
00052818        eb00d0d5        bl _Apple80211Close
00052b60        e59f1164        ldr r1, [pc, #356]      ;[0x00052ccc] = 0x0008ff54 (@@ "setAirPortStrength:")
00052bb0        eb00cfc8        bl _Apple80211CopyValue
00052be4        eb00cfc4        bl _Apple80211GetInfoCopy
00052c60        e59f1064        ldr r1, [pc, #100]      ;[0x00052ccc] = 0x0008ff54 (@@ "setAirPortStrength:")
00052c98        e59f102c        ldr r1, [pc, #44]       ;[0x00052ccc] = 0x0008ff54 (@@ "setAirPortStrength:")
00052d40        eb00cf64        bl _Apple80211CopyValue
00052dd0        e59f20e4        ldr r2, [pc, #228]      ;[0x00052ebc] = 0x00090764 (@@ "_SBAirPortUpdateTimer")
00052f1c        eb00cef6        bl _Apple80211GetInfoCopy
00053090        eb00ceae        bl _Apple80211GetIfListCopy
000530f4        eb00ce86        bl _Apple80211BindToInterface
0005310c        eb00ce74        bl _Apple80211EventMonitoringInit
00053118        eb00ce8f        bl _Apple80211StartMonitoringEvent
00053124        eb00ce8c        bl _Apple80211StartMonitoringEvent
00053130        eb00ce89        bl _Apple80211StartMonitoringEvent
000532a8        eb00ce1c        bl _Apple80211GetPower
0005333c        e59f2070        ldr r2, [pc, #112]      ;[0x000533b4] = 0x00090768 (@@ "_SBAirPortPowerChanged")
00053364        e59f204c        ldr r2, [pc, #76]       ;[0x000533b8] = 0x00090770 (@@ "_SBAirPortConfigurationChanged")
0005361c        e59f106c        ldr r1, [pc, #108]      ;[0x00053690] = 0x0008ff58 (@@ "setShowsAirPort:")
00066298        eb0082f8        bl _TPAirplaneSheetCreate
00066474        eb008119        bl _PSSetAirplaneMode
00068e08        eb007759        bl _Apple80211Close
00068ea4        eb007717        bl _Apple80211Open
00068ed4        eb00771d        bl _Apple80211GetIfListCopy
00068f18        eb0076fd        bl _Apple80211BindToInterface
00068f30        eb00770f        bl _Apple80211Close
00068f4c        eb007708        bl _Apple80211Close
000691c0        eb007740        bl _Apple80211Scan
000694a8        eb007680        bl _Apple80211Associate
00071e80        e59f311c        ldr r3, [pc, #284]      ;[0x00071fa4] = _kSCPropNetAirPortJoinMode
00071e88        e59f3118        ldr r3, [pc, #280]      ;[0x00071fa8] = _kSCValNetAirPortJoinModePreferred
```


Add your content here.  Format your content with:
  * Text in **bold** or _italic_
  * Headings, paragraphs, and lists
  * Automatic links to other wiki pages