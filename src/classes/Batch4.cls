public class Batch4 extends ChainJobParent {
    public Batch4() {
        
    }
    
    public override void doStart(Database.BatchableContext bc) {
        System.debug(LoggingLEvel.ERROR,' Started 4');
    }

    public override void doExecute(Database.BatchableContext bc, List<sObject> scope) {
        
    }

    public override void doFinish(Database.BatchableContext bc) {
        //
        System.debug(LoggingLevel.ERROR,' finish 4 started ');
    }
}