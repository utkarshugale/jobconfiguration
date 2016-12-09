global class AccountUpdate implements Database.Batchable<sObject>{
   global final String Query;
   global final String Entity;
   global final String Field;
   global final String Value;
   global AccountUpdate(String q, String e, String f, String v){
             Query=q; Entity=e; Field=f;Value=v;
   }

   
   global Database.QueryLocator start(Database.BatchableContext bc){
       return Database.getQueryLocator(query);
   }
   
   global void execute(Database.BatchableContext bc, List<Sobject> scope){
       List<Account> acc = new List<Account>();
       for(Sobject s : scope){
           s.put(Field,Value);
      }
      update scope;
   }
   global void finish(Database.BatchableContext bc){
       
   }
   
}