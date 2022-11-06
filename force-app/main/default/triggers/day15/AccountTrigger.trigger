trigger AccountTrigger on Account (before insert) {
    System.debug('account before insert trigger called');

}