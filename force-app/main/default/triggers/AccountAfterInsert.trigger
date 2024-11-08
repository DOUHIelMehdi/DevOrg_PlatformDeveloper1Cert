trigger AccountAfterInsert on Account (before insert) {
    System.debug('=== After Insert Trigger ===');
    System.debug('Trigger.isExecuting: ' + Trigger.isExecuting); 
    System.debug('Trigger.isInsert: ' + Trigger.isInsert);       
    System.debug('Trigger.isAfter: ' + Trigger.isAfter);         
    System.debug('Trigger.size: ' + Trigger.size);               
    System.debug('Trigger.new: ' + Trigger.new);                
    System.debug('Trigger.newMap: ' + Trigger.newMap);
}