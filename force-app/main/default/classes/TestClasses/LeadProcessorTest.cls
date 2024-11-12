@isTest
private class LeadProcessorTest {

    @isTest
    static void testProcessNewLeads() {
        //1-create test data
        List<Lead> testLeads = new List<Lead>();
        
        //2-create 2 leads : one with Web &&  second with values !=Web
        Lead WebLead = new Lead(
            FirstName = 'El--M',
            LastName = 'EL--M--D',
            Company = 'EHEIO ,Inc',
            LeadSource = 'Web'
        );
        testLeads.add(WebLead);
        
        Lead EmailLead = new Lead(
            FirstName = 'El--M2',
            LastName = 'EL--M--D2',
            Company = 'EHEIO2 ,Inc',
            LeadSource = 'Email'
        );
        testLeads.add(EmailLead);

        //3-insert the leads created to fire the triggers
        insert testLeads;

        //4-retrieve data from DB to check status updated or not ?

        List<Lead> leadAfterInsert = [
            SELECT Id, LeadSource , Status
            FROM Lead
            WHERE Id IN:testLeads
        ];

        //5-verify the status with assertions
        for(Lead lead:leadAfterInsert){
            if(lead.LeadSource == 'Web')
                {System.assertEquals('Qualified', lead.status, 'Web Lead should be qualified');}
            else if(lead.LeadSource =='Email')
                {System.assertNotEquals('Qualified', lead.Status,'Email Lead SHOULD NOT be qualified');}
        }
    } 
}