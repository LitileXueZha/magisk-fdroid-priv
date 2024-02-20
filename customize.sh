#!/sbin/sh

# https://topjohnwu.github.io/Magisk/guides.html#customization
#
MODDIR=${0%/*}

APKDIR="$MODDIR/system/priv-app/FDroidPrivilegedExtension"
SHA256="1008525a17b4f6a93ac690f9c50dcb675b6bebf53d2879dbc98ba65a1cb2e28d"
APPURL="https://f-droid.org/repo/org.fdroid.fdroid.privileged_2130.apk"

if [ ! -f $APKDIR/base.apk ];then
    wget -P $APKDIR -O base.apk $APPURL
fi
ret=`sha256sum $APKDIR/base.apk`

if [ ! $ret = $SHA256 ];then
    ui_print ******
    ui_print sha256 check failed!
    ui_print Download offical apk not successful, you may need to download
    ui_print $APPURL by yourself and repack into $ZIPFILE
    ui_print ******
    abort exit
fi
