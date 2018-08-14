#!/bin/sh
go generate
GOOS=linux GOARCH=arm go build -tags vfs
# app install
# adb install apks/xhs.apk
#  uiserver
# adb install apks/app-xhs.apk
# uiserver-test
# adb install apks/app-xhs-test.apk
# ADB输入法
# adb install apks/keyboardservice.apk
# GT性能组件
# adb install apks/GT-for-red.apk
adb push atx-agent /data/local/tmp
adb shell chmod 755 /data/local/tmp/atx-agent
adb shell /data/local/tmp/atx-agent -stop
adb shell /data/local/tmp/atx-agent -d -t 10.23.172.90:8080 -ta 1