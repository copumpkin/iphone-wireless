#ifndef APPLE80211_H_
#define APPLE80211_H_

#ifdef __OBJC__

    #import <Foundation/NSString.h>
    #import <Foundation/NSArray.h>
    #import <Foundation/NSDictionary.h>

    int Apple80211Open(void **handle);

    int Apple80211BindToInterface(void *handle, NSString *interface);

    int Apple80211Scan(void *handle, NSArray **networks, NSDictionary *parameters);

    int Apple80211Close(void *handle);

#else

    #include <CoreFoundation/CoreFoundation.h>

    int Apple80211Open(void **handle);

    int Apple80211BindToInterface(void *handle, CFStringRef interface);

    int Apple80211Scan(void *handle, CFArrayRef *networks, CFDictionaryRef parameters);

    int Apple80211Close(void *handle);

#endif /* __OBJC__ */

#endif /* APPLE80211_H_ */