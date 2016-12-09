@isTest(seeAllData=false)
public with sharing class TestJobChainConfiguration {
    
    @testSetup
    public static void createSeedData() {
        
        Account acc = new Account();
        acc.Name = 'TEstAccount';
        
        insert acc;
        
        List<Job_Configuration__c> jobconfig = new List<Job_Configuration__c>();
        Job_Configuration__c config;
        
        for(Integer i = 0;i < 2; i++) {
            config = new Job_Configuration__c();
            config.Priority__c = i + 1000;
            config.Apex_Class__c = 'Batch'+ (i+4);
            config.Batch_Size__c = i * 20;
            config.Query_Factory_Class__c = 'QueryStore';
            config.Batch_Job_Name__c = 'Batch '+(i+3);
            
            jobConfig.add(config);
        }
        
        //for QueryStoreForCLLoan
        config = new Job_Configuration__c();
        config.Priority__c = 1003;
        config.Apex_Class__c = 'Batch3';
        config.Batch_Size__c = 20;
        config.Query_Factory_Class__c = 'QueryStoreForCLLoan';
        config.Batch_Job_Name__c = 'Billing Job';
        jobConfig.add(config);
        
        System.debug(LoggingLevel.ERROR,' configs '+jobConfig);
        insert jobConfig;
        
    }
    
    public static testMethod void executeBatchChain() {
        
        Test.startTest();
        String s = 'Select Id,Name from User';
		ConfigurationMonitor b = new ConfigurationMonitor(s);
		Database.executeBatch(b);
        Test.stopTest();
    }
    
}