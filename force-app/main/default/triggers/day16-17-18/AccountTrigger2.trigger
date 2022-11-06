trigger AccountTrigger2 on Account (after insert) {
             system.debug('account before update trigger called.');
}