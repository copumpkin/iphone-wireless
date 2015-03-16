The Scan functions take a parameters `CFDictionary` that is translated internally into a struct. This is me attempting to work out what that struct contains. Note that this is for RE reference only, as the struct is never exposed through the Apple80211 library, and is built internally.

merge = true by default

```

struct Apple80211Parameters {
    int unk0;
    int scan_bss_type; //offset 0x4 (defaults to 3)
    char bssid[6];        // offset 0x8
    char unk1[2];        // offset 0xE
    int ssid_str_len; // offset 0x10
    char ssid_str[32]; // offset 0x14
    int scan_type; // offset 0x34 (defaults to 1)
    int scan_phy_mode; // offset 0x38 (defaults to 1)
    int scan_dwell_time; // offset 0x3c (defaults to 0)
    int scan_rest_time; // offset 0x40 (defaults to 0)
    int channel_count; // offset 0x44
    struct {
        int present;
        int channel;
        int channel_flags;
    } channels[64];
    int    flags;   // offset 0x348
};

```

phew that was a lot of work!! tomorrow I'll put it to good use