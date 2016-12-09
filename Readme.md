## Background

Currently, Daily Processing Job Chain sequence is hardcoded in every product. Batch Job sequence is not easily configurable.
Only one batch size can be defined for entire org. No mechanism to specify configurable batch sizes for each job. There are many situations in implementations where batch size needs to be different for difference batch jobs.

Implementation need to make an assumption on 'Daily Processing Completion' when they want to schedule Local batch jobs (customer specific batch jobs), which must run after daily job processing chain.

## Benefits to CL Products / PS Services
1. Batch jobs will be loosely coupled in chaining. Batch job sequence is easily configurable provided it does not breach dependency sequence defined by each package.
2. Custom batch jobs written in subscribers org can be easily chained with 'Daily Job Processing Chain'. No need to make assumptions on daily job processing completion to schedule custom jobs.
3. Each Batch Job can have different configurable batch size.
4. Custom Batch Jobs can be incorporated easily in daily batch processing chain provided it does not break dependency sequence.
For ex: CustomJobA needs to run after BillingJob but before DelinquencyJob. This can be configured easily. 
5. Batch Job default queries are easily configurable.
6. Independent batch jobs from different packages can be easily configured in single chain. 
Not need to schedule starting job of each chain separately.

## Improvements Roadmap
1. Job Configuration object sure ensure dependency sequence defined by each package before configurations are stored.
2. Each configured chain should have mechanism to run in parallel threads.
