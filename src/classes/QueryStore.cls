/* 
* default implementation of QueryStore provided by package for CL Loan
* QueryStore uses ProcessJobQueryUtil3.cls from CL Loan
*/
public class QueryStore implements IQueryFactory {
    
    public String getQuery(String batchJobName) {
        
        if(batchJobName == 'Batch 3') {
            return 'Select Id,Name from Account limit 10';
        }else if(batchJobName == 'Batch 4') {
            return 'Select Id,Name from User limit 1';
        }else if(batchJobName == 'Batch 5') {
            return 'Select Id,Name from User limit 1';
        }
        
        return null;            
    }
}