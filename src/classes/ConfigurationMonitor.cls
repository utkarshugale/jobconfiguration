global class ConfigurationMonitor implements Database.Batchable<SObject>,Schedulable {
    
    private String query;
    
    global ConfigurationMonitor(String query) {
        //We just need some query to return a recordset which will never be empty.
        this.query = query;
    }
    
    public Database.querylocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(query);
    }
    
    public void execute(SchedulableContext sc) {
        //[To Do in V2] - Parallelism processing logic goes here.
    }

    public void finish(Database.BatchableContext bc) {
        
        //We do not need scope so not using scope anywhere.
        
        //get configuration objects from DB with Priority 1.
        List<Job_Configuration__c> configurations = [Select Id,Name,
                                                            Priority__c,
                                                            Batch_Job_Name__c,
                                                            Apex_Class__c,
                                                            Namespace_Prefix__c,
                                                            Batch_Size__c,
                                                            Query_Factory_Class__c,
                                                            QueryFactory_Namespace_Prefix__c
                                                     From Job_Configuration__c
                                                     order by Priority__c ASC]; 
        
        if(!configurations.isEmpty()) {
	        ConfigurationMonitorManager action = new ConfigurationMonitorManager(configurations);
	        action.executeChain();
        }else{
            throw new ProcessingException(' No Records found in Job Configuration.');
        }
    }

    public void execute(Database.BatchableContext bc, List<sObject> scope)  {
        
    }
    
    
}