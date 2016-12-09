public class Batch3 extends ChainJobParent {
    public Batch3() {
    }
   
    public override void doStart(Database.BatchableContext bc) {
        //do nothing.
    }
    
    public override void doExecute(Database.BatchableContext bc, List<sObject> scope) {
        //Print
        System.debug(LoggingLevel.ERROR,scope.get(0)+'');
    }

    public override void doFinish(Database.BatchableContext bc) {
        //
        System.debug(LoggingLevel.ERROR,' finish started ');
    }
    
}