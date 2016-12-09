public class JobConfigurationStructure {
    
    public Integer priority;
    public String apexClassName;
    public Decimal batchSize;
    public String queryFactory;
    public String namespacePrefix;
    
    public JobConfigurationStructure(Decimal priority,String apexClassName,Decimal batchSize,
                                     String queryFactory,String namespacePrefix) {
    
        this.priority = (Integer)priority;
        this.apexClassName = apexClassName;
        this.batchSize = batchSize;
        this.queryFactory = queryFactory;
        this.namespacePrefix = namespacePrefix;                                    
    }
    
    
}