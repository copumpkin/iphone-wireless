We deal with anything wireless on the iPhone: 802.11, GSM, and Bluetooth.

## [Stumbler](Stumbler.md) ##
Stumbler lets you view the wireless networks in your area. While right now Stumbler only handles 802.11 networks, soon you should see Bluetooth and GSM capabilities as well.
##  ##
Stumbler is still in a early Alpha stage, but it is fully functional, and pretty stable.
##  ##
**Planned Features**
  * Auto Scanning
  * Manufacturer detection
  * Logging
  * A-GPS
  * Raw 802.11 packet capture (monitor mode)

## MobileApple80211 ##

MobileApple80211 is a framework roughly analogous to the Apple80211.framework (private) on "big" Mac OS X.

Most of the effort is currently going into working out how the various functions available work, but eventually we plan on pulling the statically linked code out of the existing apps that use it, and making it into a more direct library, without using the dynamic linker.

At first glance, the library appears to be a highly object-oriented version of the mainstream Apple80211 framework. It uses CoreFoundation objects wherever one might expect them, instead of structs and so on. Given that the Apple80211 framework is a private framework, it might possibly be an indication of Apple intending to revise the mainstream framework in Leopard.

For a list of the currently known functions, please see Apple80211Functions.

And yes, we're open to suggestions of better names. Submit an issue or contact us in #iphone-80211 on irc.osx86.hu.