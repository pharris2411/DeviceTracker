# DevopsDeviceNanny

A system to alert on USB devices being added/removed.

## Installation

Create a file at `/etc/udev/rules.d/999-alert-usb.rules` with:

* Copy `999-usb-alert.rules` to `/etc/udev/rules.d/`
* Copy `usb-alert.pl` to `/usr/local/bin/`

Example JSON posted by `usb-alert.pl`:

```
{
   "model" : "Plantronics C725",
   "model_id" : "c034",
   "serial" : "DB30EBB257423B4F82A41A6792909359",
   "state" : "remove",
   "vendor" : "Plantronics, Inc.",
   "vendor_id" : "047f"
}
```

