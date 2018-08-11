#!/bin/sh
go generate
GOOS=linux GOARCH=arm go build -tags vfs
adb install apks/app-xhs.apk
adb install apks/app-xhs-test.apk
adb install apks/keyboardservice.apk
adb push atx-agent /data/local/tmp
adb shell chmod 755 /data/local/tmp/atx-agent
adb shell /data/local/tmp/atx-agent -d -t 192.168.0.101:8080 -ta 1