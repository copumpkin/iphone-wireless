#include <CoreFoundation/CoreFoundation.h>
#include <dlfcn.h>

void *dlHandle;

int (*__Apple80211Associate)();
int (*__Apple80211BindToInterface)(void *, CFStringRef);
int (*__Apple80211Close)(void *) ;
int (*__Apple80211CopyValue)();
int (*__Apple80211EventMonitoringHalt)();
int (*__Apple80211EventMonitoringInit)();
int (*__Apple80211Get)();
int (*__Apple80211GetIfListCopy)(void *, CFArrayRef *);
int (*__Apple80211GetInfoCopy)(void *, CFDictionaryRef *);
int (*__Apple80211GetInterfaceNameCopy)(void *, CFStringRef *);
int (*__Apple80211GetPower)();
int (*__Apple80211Open)(void **);
int (*__Apple80211Parse80211dIE)();
int (*__Apple80211ParseAppleIE)();
int (*__Apple80211ParseRSNIE)();
int (*__Apple80211ParseSES_IE)();
int (*__Apple80211ParseWPAIE)();
int (*__Apple80211Scan)(void *, CFArrayRef *, CFDictionaryRef);
int (*__Apple80211ScanAsync)();
int (*__Apple80211ScanDynamic)();
int (*__Apple80211Set)();
int (*__Apple80211SetPower)();
int (*__Apple80211StartMonitoringEvent)();
int (*__Apple80211StopMonitoringEvent)();

#define EXPECT(condition) if(!condition) { printf("failed: %s\n", #condition);  return; }

#define LOAD_SYMBOL(symbol) \
__ ## symbol = dlsym(dlHandle, #symbol); \
EXPECT(__ ## symbol)

__attribute__ ((constructor)) void start() {
    dlHandle = dlopen("/System/Library/SystemConfiguration/Aeropuerto.bundle/Aeropuerto", RTLD_LAZY);
    
    if (!dlHandle) {
        char *error = dlerror();
        if (error) {
            printf("dlopen error: %s\n", error);
        } else {
            printf("dlopen error\n");
        }
    }
    
    LOAD_SYMBOL(Apple80211Associate)
    LOAD_SYMBOL(Apple80211BindToInterface)
    LOAD_SYMBOL(Apple80211Close)
    LOAD_SYMBOL(Apple80211CopyValue)
    LOAD_SYMBOL(Apple80211EventMonitoringHalt)
    LOAD_SYMBOL(Apple80211EventMonitoringInit)
    LOAD_SYMBOL(Apple80211Get)
    LOAD_SYMBOL(Apple80211GetIfListCopy)
    LOAD_SYMBOL(Apple80211GetInfoCopy)
    LOAD_SYMBOL(Apple80211GetInterfaceNameCopy)
    LOAD_SYMBOL(Apple80211GetPower)
    LOAD_SYMBOL(Apple80211Open)
    LOAD_SYMBOL(Apple80211Parse80211dIE)
    LOAD_SYMBOL(Apple80211ParseAppleIE)
    LOAD_SYMBOL(Apple80211ParseRSNIE)
    LOAD_SYMBOL(Apple80211ParseSES_IE)
    LOAD_SYMBOL(Apple80211ParseWPAIE)
    LOAD_SYMBOL(Apple80211Scan)
    LOAD_SYMBOL(Apple80211ScanAsync)
    LOAD_SYMBOL(Apple80211ScanDynamic)
    LOAD_SYMBOL(Apple80211Set)
    LOAD_SYMBOL(Apple80211SetPower)
    LOAD_SYMBOL(Apple80211StartMonitoringEvent)
    LOAD_SYMBOL(Apple80211StopMonitoringEvent)
}

int Apple80211Associate() { return 0; }

int Apple80211BindToInterface(void *handle, CFStringRef interface) {
    return __Apple80211BindToInterface(handle, interface);
}

int Apple80211Close(void *handle)  {
    return __Apple80211Close(handle);
}

int Apple80211CopyValue() { return 0; }
int Apple80211EventMonitoringHalt() { return 0; }
int Apple80211EventMonitoringInit() { return 0; }
int Apple80211Get() { return 0; }

int Apple80211GetIfListCopy(void *handle, CFArrayRef *interfaces) { 
    return __Apple80211GetIfListCopy(handle, interfaces);
}

int Apple80211GetInfoCopy(void *handle, CFDictionaryRef *info) { 
    return __Apple80211GetInfoCopy(handle, info);
}

int Apple80211GetInterfaceNameCopy(void *handle, CFStringRef *interface) {
    return __Apple80211GetInterfaceNameCopy(handle, interface);
}

int Apple80211GetPower() { return 0; }

int Apple80211Open(void **handle) { 
    return __Apple80211Open(handle);
}

int Apple80211Parse80211dIE() { return 0; }
int Apple80211ParseAppleIE() { return 0; }
int Apple80211ParseRSNIE() { return 0; }
int Apple80211ParseSES_IE() { return 0; }
int Apple80211ParseWPAIE() { return 0; }

int Apple80211Scan(void *handle, CFArrayRef *networks, CFDictionaryRef parameters) { 
    return __Apple80211Scan(handle, networks, parameters);
}

int Apple80211ScanAsync() { return 0; }
int Apple80211ScanDynamic() { return 0; }
int Apple80211Set() { return 0; }
int Apple80211SetPower() { return 0; }
int Apple80211StartMonitoringEvent() { return 0; }
int Apple80211StopMonitoringEvent() { return 0; }

__attribute__ ((destructor)) void stop() {
    int ret = dlclose(dlHandle);
    
    if (ret != 0) {
        char *error = dlerror();
        if (error) {
            printf("dlclose error: %s\n", error);
        } else {
            printf("dlclose error\n");
        }        
    }
}