create database bank_loan;
use bank_loan;

select * from loan_approved_clean;

alter table loan_approved_clean drop myunknowncolumn;

-- view the first 10 records from the table.
select * from loan_approved_clean limit 10;

-- count the total number of loan applications.
select count(*) as total_applicatants from loan_approved_clean;

-- list all unique property areas.
select distinct(property_area) from loan_approved_clean; 

-- show all applicants who are self-employed and have an income above 5000.
select * from loan_approved_clean where self_employed = "yes" and applicantincome > 5000;
select count(*) from loan_approved_clean where self_employed = "yes" and applicantincome > 5000;

-- find the total number of approved loans.
select count(*) as loan_approved from loan_approved_clean where loan_status ='y';

-- Find average loan amount by education level.
select education, round(avg(loanamount),2) from loan_approved_clean group by  education;

-- Find average total income (Applicant + coapplicant) by marital status.
select married, round(avg(Applicantincome + coapplicantincome),2) total_income from loan_approved_clean group by married;

-- show average loan amount by credit history
select credit_history, round(avg(loanamount),2) from loan_approved_clean group by   credit_history;

-- Find total applications and approval rate by gender
select * from loan_approved_clean;
select gender,
	   count(*) as total_applicants,
       sum(case when loan_status = 'Y' then 1 else 0 end) as approved,
       round(sum(case when loan_status = 'Y' then 1 else 0 end)/count(*)*100,2) as approved_rate
from loan_approved_clean group by gender;

-- Approval rate by property area

-- show applicants who are  graduates, not self- employed, and have loan  amount gratae then 150.
select * from loan_approved_clean where education = 'graduate' and Self_Employed='no' and
LoanAmount>150;

-- Display approved loans from urban area with good credit history.
select * from loan_approved_clean where Property_Area='Urban' and Credit_History= 1 and Loan_Status = 'Y';

-- List top 5 applicants with highest total income.
select *, (ApplicantIncome+coapplicantIncome) as Total_income
from  loan_approved_clean order by Total_income desc limit 5;

-- Create  columns for total income  each applicant. 
select *, (ApplicantIncome+CoapplicantIncome) as Total_income from loan_approved_clean; 

-- Classify applicants into income groups (Low , Medium, High) based on applicant income.
select ApplicantIncome from loan_approved_clean  order by ApplicantIncome desc;

select Loan_ID,
	   ApplicantIncome,
       case
           when ApplicantIncome<3000 then 'Low'
           when ApplicantIncome between 3000 and 6000 then 'Medium income'
           else 'High income'
           end as income_group
from loan_approved_clean ;

-- Find average loan amount for each income group.
select 
       case
           when ApplicantIncome<3000 then 'Low income'
           when ApplicantIncome between 3000 and 6000 then 'Medium income'
           else 'High income'
           end as income_group,
           round(avg(LoanAmount),2) as avg_loan
from loan_approved_clean group by income_group;

-- Find applicants whose loan amount is greater then the overall average loan amount.
select * from  loan_approved_clean
where LoanAmount > ( select avg (LoanAmount) from  loan_approved_clean);

-- Identify the property area with the highest average total income. 
select property_area, avg(applicantincome+coapplicantincome) as avg_income from  loan_approved_clean
group by Property_Area order by avg_income desc limit 1;

-- Rank applicants based on total income (higest income rank = 1). 
select Loan_ID,
	   ApplicantIncome+CoapplicantIncome as Total_income,
       rank() over (order by(ApplicantIncome+CoapplicantIncome)) as Rank_numbar from  loan_approved_clean;

-- Show average loan amount per property area using a window function.
SELECT 
    Loan_ID,
    AVG(applicantincome+coapplicantincome) OVER (PARTITION BY property_area) AS avg_loan_amount_per_area
FROM loan_approved_clean;

-- Calculate approval rate by education using window function.
SELECT
    education,
    loan_ID,
    AVG(CASE WHEN loan_ID = 'Approved' THEN 1.0 ELSE 0 END)
        OVER (PARTITION BY education) AS approval_rate_by_education 
FROM loan_approved_clean;

-- Compare approval rate by credit history and education level to find which combination performs best.
SELECT DISTINCT
    credit_history,
    education,
    AVG(CASE WHEN loan_ID = 'Approved' THEN 1.0 ELSE 0 END)
        OVER (PARTITION BY credit_history, education) AS approval_rate
FROM loan_approved_clean;






