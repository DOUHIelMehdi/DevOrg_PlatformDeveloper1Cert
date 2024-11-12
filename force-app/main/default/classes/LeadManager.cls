public with sharing class LeadManager {


    //method to verif new leads
    public static void processLeads(List<Lead> newLeads) {
        //remove duplicate 
        List<Lead> removeDuplicatedLeads = removeDuplicateLeads(newLeads);
        //qualifiying leads
        List<Lead> qualifiedLeads = qualifyLeads(removeDuplicatedLeads);
        //assigning leads
        //sending notifications
    }
    
        //helper methods to remove duplicate leads based on email
    private static List<Lead> removeDuplicateLeads(List<Lead> leads){
        Set<String> emailSet = new Set<String>();
        List<Lead> uniqueLeads = new List<Lead>();

        for (Lead v : leads) {
            if (v.Email !=null && !emailSet.contains(v.Email)) {
                emailSet.add(v.Email);
                uniqueLeads.add(v);
            }
        }
        return uniqueLeads;
    }
        //helper method to qualify leads based on company size or industry
    private static List<Lead> qualifyLeads(List<Lead> Leads){
        List<Lead> qualifiedLeads = new List<Lead>();
        Set<String> hightPrioIndustry = new Set<String>{'Finance','Technology','Healtcare'};
        
        for (Lead qualifLead : Leads) {
            if((qualifLead.Company_Size__c >=50)  || 
            hightPrioIndustry.contains(qualifLead.Industry)){
                qualifLead.Status = 'Qualified';
                qualifiedLeads.add(qualifLead);
            }
        }
        return qualifiedLeads;
    }
}