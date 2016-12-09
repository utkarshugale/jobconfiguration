public class ConfigurationMonitorManager {
    
    private List<Job_Configuration__c> configurations;
    
    public ConfigurationMonitorManager(List<Job_Configuration__c> configs) {
        this.configurations = configs;
    }
    
    public void executeChain() {
        Job_Configuration__c startConfig = configurations.remove(0);
        
        //Validate configuration details
        try {
            validateConfig(startConfig);    
        }catch(Exception e) {
            if(!startConfig.Ignore_Exception__c) {
                throw e;
            }
        }
        
        //Coding to interface here. [To Do] - Ensure 'Out of bounds' exception is handled later. 
        ChainJobParent startJob = (ChainJobParent)ReflectionUtil.getNewInstance(startConfig.Namespace_Prefix__c,startConfig.Apex_Class__c);
        
        //get Query from QueryFactory
        IQueryFactory queryfinder = (IQueryFactory)ReflectionUtil.getNewInstance(startConfig.QueryFactory_Namespace_Prefix__c,startConfig.Query_Factory_Class__c);
        String query = queryFinder.getQuery(startConfig.Batch_Job_Name__c);
        
        //Safegurad check: 
        if(startJob != null && !String.isBlank(query)) {
            startJob.setJobName(startConfig.Batch_Job_Name__c);
            startJob.setQuery(query);
            startJob.setJobConfigurations(configurations);
        }
        
        //Call Batch apex with batch size given in settings
        System.debug(LoggingLevel.ERROR,' calling batch ');
        Database.executeBatch(startJob,(Integer)startConfig.Batch_Size__c);    
    }
    
    public void validateConfig(Job_Configuration__c currentConfig) {
        //Check if class name is empty
        if(String.isBlank(currentConfig.Batch_Job_Name__c)) {
            throw new ProcessingException('Batch Job Name not provided in configuration : '+currentConfig.Name);    
        }
        
        //Set batch size to default if null
        if(currentConfig.Batch_Size__c == null || currentConfig.Batch_Size__c == 0) {
            currentConfig.Batch_Size__c = 200;
        }
    }
}