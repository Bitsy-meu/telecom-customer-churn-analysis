-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Churned Customers
SELECT COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes';

-- Churn Rate
SELECT
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers;

-- Churn by Contract
SELECT
    Contract,
    COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY churned_customers DESC;

-- Churn by Payment Method
SELECT
    PaymentMethod,
    COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes'
GROUP BY PaymentMethod
ORDER BY churned_customers DESC;

-- Average Monthly Charges by Churn Status
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM customers
GROUP BY Churn;

-- Churn by Tenure Group
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS tenure_group,
    COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes'
GROUP BY tenure_group
ORDER BY churned_customers DESC;
