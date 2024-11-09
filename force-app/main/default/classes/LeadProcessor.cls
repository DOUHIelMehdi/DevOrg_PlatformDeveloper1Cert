public with sharing class LeadProcessor {
    public static void processNewLeads(List<Lead> newLeads) {
        List<Lead> leadToUpdate = new List<Lead>();
        for(Lead lead : leadToUpdate){
            if(lead.LeadSource == 'Web'){
                lead.status = 'Qualified';
                leadToUpdate.add(lead);
            }
        }
        if(!leadToUpdate.isEmpty()){update leadToUpdate;}
    }
}