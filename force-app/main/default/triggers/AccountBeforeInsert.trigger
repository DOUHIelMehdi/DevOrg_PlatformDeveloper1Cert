trigger AccountBeforeInsert on Account (before insert) {
    system.debug('=== before insert trigger ===');
    system.debug('Trigger.isExecuting'+Trigger.isExecuting);
    system.debug('Trigger.isInsert'+Trigger.isInsert);
    system.debug('Trigger.iBefore'+trigger.isBefore);
    system.debug('Trigger.size'+trigger.size);
    system.debug('Trigger.new'+trigger.new);
    system.debug('Trigger.newMap'+trigger.newMap);
    
}