# Sample Data from Freddie Mac's 
This is a repository for sample of Freddie Mac's Single Family Loan-Level Dataset. This is a realistic data for credit risk analytics.

# How to construct the sample dataset
I download the copy of the data from [Zenodo](https://zenodo.org/records/8401978) that contains origination and performance data up to 2022Q2. 

From the text file, I proceed to import the data to a DuckDB database.

Then using the `sampling.sql`, I am able to create a subset of data, `sampler.csv` and `performance_sampler.csv` of loan originated in Q1 2020. The sample data contained 9,572 loan_id.
