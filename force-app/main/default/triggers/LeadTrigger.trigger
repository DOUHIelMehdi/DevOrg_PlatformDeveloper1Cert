trigger LeadTrigger on Lead (after insert) {
    LeadProcessor.processNewLeads(Trigger.new);
    System.debug('the LeadTrigger just executed');
}