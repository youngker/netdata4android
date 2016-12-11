# netdata4android

[netdata](https://github.com/firehol/netdata) running on android.

## Requirements

- Android 7.0 Nougat
- adb forward tcp:19999 tcp:19999

## netdata.conf

```shell
[global]
    update every = 1000000 // 1s
    update every = 10000   // 10ms
```
