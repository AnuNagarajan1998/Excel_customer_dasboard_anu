SELECT 
  FORMAT_DATE('%Y', sales.OrderDate) AS Year,
  FORMAT_DATE('%B', sales.OrderDate) AS Month,
  SUM(sales.Quantity) AS Total_sales
FROM 
  `anudataanalyst.sales_data.Sales` AS sales
GROUP BY 
  Year,
  Month
ORDER BY
  Year