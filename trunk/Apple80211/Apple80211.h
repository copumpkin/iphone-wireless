#include <CoreFoundation/CoreFoundation.h>

int Apple80211Open(void **handle);

int Apple80211BindToInterface(void *handle, CFStringRef interface);

int Apple80211Scan(void *handle, CFArrayRef *networks, CFDictionaryRef parameters);

int Apple80211Close(void *handle);