public with sharing class LeadProcessor {
    // Méthode pour traiter les nouveaux leads
    public static void processNewLeads(List<Lead> newLeads) {
        // Initialisation d'une liste pour stocker les leads à mettre à jour
        List<Lead> leadsToUpdate = new List<Lead>();
        
        // Initialisation d'une carte (Map) pour compter le nombre de leads par domaine de courriel
        Map<String, Integer> domainLeadCount = new Map<String, Integer>();
        
        // Boucle à travers chaque lead dans la liste de nouveaux leads
        for (Lead lead : newLeads) {
            // Extrait le domaine de l'email du lead, ou utilise 'unknown.com' si le champ Email est nul
            String emailDomain = lead.Email != null ? lead.Email.substringAfter('@') : 'unknown.com';
            
            // Vérifie si le domaine existe déjà dans la carte (Map)
            if (domainLeadCount.containsKey(emailDomain)) {
                // Si oui, augmente le compteur de leads pour ce domaine de 1
                domainLeadCount.put(emailDomain, domainLeadCount.get(emailDomain) + 1);
            } else {
                // Sinon, ajoute le domaine avec un compteur initial de 1
                domainLeadCount.put(emailDomain, 1);
            }
            
            // Vérifie si le lead provient d'une source Web
            if (lead.LeadSource == 'Web') {
                // Si oui, change le statut du lead à 'Qualified'
                lead.Status = 'Qualified';
                
                // Ajoute le lead à la liste des leads à mettre à jour
                leadsToUpdate.add(lead);
            }
        }
        
        // Si la liste des leads à mettre à jour n'est pas vide
        if (!leadsToUpdate.isEmpty()) {
            // Effectue une mise à jour en base de données pour tous les leads qualifiés
            update leadsToUpdate;
        }
        
        // Affiche dans les logs le nombre de leads par domaine de courriel
        System.debug('Lead counts per domain: ' + domainLeadCount);
    }
}