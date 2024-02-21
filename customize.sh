#!/system/bin/sh

# https://topjohnwu.github.io/Magisk/guides.html#customization
#


APK="$MODPATH/system/priv-app/FDroidPrivilegedExtension/base.apk"
SHA256="1008525a17b4f6a93ac690f9c50dcb675b6bebf53d2879dbc98ba65a1cb2e28d"
APPURL="https://f-droid.org/repo/org.fdroid.fdroid.privileged_2130.apk"

if [ ! -f $APK ];then
    ui_print "downloading apk..."
    wget --no-check-certificate -T 30 -O $APK $APPURL
fi
ret=`sha256sum $APK | head -c 64`
#ui_print "$? $ret $(pwd) $APKDIR $APPURL"

if [ "$ret" != "$SHA256" ];then
    ui_print "******"
    ui_print "sha256 check failed!"
    ui_print "Download offical apk not successful, you may need to download"
    ui_print "$APPURL"
    ui_print "by yourself and repack into the zip file."
    ui_print "******"
    abort exit
fi
