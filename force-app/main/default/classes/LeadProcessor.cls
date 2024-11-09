public with sharing class LeadProcessor {
    public static void processNewLeads(List<Lead> newLeads) {
        List<Lead> leadToUpdate = new List<Lead>();
        for(Lead lead : newLeads){
            if(lead.LeadSource == 'Web'){
                Lead updatedLead = new Lead(Id=lead.Id);
                updatedLead.status = 'Qualified';
                leadToUpdate.add(updatedLead);
            }
        }
        if(!leadToUpdate.isEmpty())
            {update leadToUpdate;}
    }
}