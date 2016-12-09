global abstract class ChainJobParent implements Chainable,Database.batchable<sObject>,Database.stateful {
    
    //[Note]Change to public when merging.
    global String jobQuery;
    private List<Job_Configuration__c> configurations;
    
    //[Note]change to public when merging.
    global String batchJobName;
    
    private Set<Id> recordsetIDs;
    
    global ChainJobParent() {
        this.recordsetIDs = new Set<Id>();
    }
    
    public void runNextJobInQueue(String currentJob) {
        //Check current job
        System.debug(LoggingLevel.eRROR,' Current Job Name : '+currentJob);
        System.debug(LoggingLevel.eRROR,' Configs : '+configurations.size());
        //Get Next Job
        if(!configurations.isEmpty()) {
	        ConfigurationMonitorManager action = new ConfigurationMonitorManager(configurations);
	        action.executeChain();
        }
    }
    
    public Database.querylocator start(Database.BatchableContext bc) {
        doStart(bc);
        return Database.getQueryLocator(this.jobQuery);
    }

    public void execute(Database.BatchableContext bc, List<sObject> scope) {
        System.debug(LoggingLevel.ERROR,scope.get(0)+'');
        doExecute(bc,scope);
    }

    public void finish(Database.BatchableContext bc) {
         doFinish(bc);
         
         runNextJobInQueue(this.batchJobName);
    }
    
    public void setQuery(String query){
        this.jobQuery = query;
    }
    
    public void setJobConfigurations(List<Job_Configuration__c> configs){
        this.configurations = configs;
    }
    
    public void setRecordSetIds(Set<Id> recordSetIds) {
        this.recordSetIds = recordSetIds;
    }
    
    public void setJobName(String jobName) {
        this.batchJobName = jobName;
    }
    global abstract void doStart(Database.BatchableContext bc);
    global abstract void doExecute(Database.BatchableContext bc, List<sObject> scope);
    global abstract void doFinish(Database.BatchableContext bc);
    
}