global Interface Chainable {
    
    void runNextJobInQueue(String currentJob);
   
    void setQuery(String query);
    
    void setJobName(String jobName);
    
    void setJobConfigurations(List<Job_Configuration__c> configs);
    
    //Specific CL products Case
    void setRecordSetIDs(Set<ID> recordSetIds);
}