# Ideas #

Right now these are just udeas to flesh out:
Using a web broker service to WiGLE, allow an app to submit any bssids/cellids it sees to our web service.  We then search WiGLE and our cell id db, and also populate our cell id db from WiGLE results.  We return the lat/longs of the different points to the phone, and you have a general idea of where you are - also have a link to take you too that point in the Maps app.  By either having the power lvls sent, or by doing the logic on the phone, we can average out the locations.
We should also cache WiGLE results to cut down on traffic.  In the same vein, we should use some form of binary compressed query and answer format - BSSIDs are hex, no reason to represent them as strings!

Sample code from pumpkin for BSSIDs:
```
/* Compile using arm-apple-darwin-cc -framework CoreFoundation -larmfp list.c -o list
 * and run with ./list after copying it into a bin directory on the phone
 */

#include <dlfcn.h>
#include <stdio.h>

#include <CoreFoundation/CoreFoundation.h>

int main() {
    void *handle = dlopen("/System/Library/Frameworks/Preferences.framework/Preferences", RTLD_LAZY);
    int (*open)(void *) = dlsym(handle, "Apple80211Open");
    int (*bind)(void *, CFStringRef) = dlsym(handle, "Apple80211BindToInterface");
    int (*close)(void *) = dlsym(handle, "Apple80211Close");        
    int (*scan)(void *, CFArrayRef *, void *) = dlsym(handle, "Apple80211Scan");
    
    void *airportHandle;
    
    open(&handle);
    
    bind(handle, CFSTR("en0"));
    
    CFDictionaryRef parameters = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    
    CFArrayRef networks;
    
    scan(handle, &networks, parameters);
    
    int i;
    
    for (i = 0; i < CFArrayGetCount(networks); i++) {
        CFDictionaryRef network = CFArrayGetValueAtIndex(networks, i);
        
        CFShow(CFDictionaryGetValue(network, CFSTR("BSSID")));
    }
    
    close(handle);
    
    dlclose(handle);
    
    return 0;
}
```