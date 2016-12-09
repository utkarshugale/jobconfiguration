global Interface IQueryFactory {
    
    /*
    * Method is expected to be implemented in Factory pattern.
    * Method should return different Dynamic SOQL for each batch job received as a parameter.
    */
    String getQuery(String batchJobName);
    
}