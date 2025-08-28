SELECT 
  FORMAT_DATE('%Y', sales.OrderDate) AS Year,
  customers.Country,
  COUNT(customers.Country)
FROM 
  `anudataanalyst.sales_data.Sales` AS sales
LEFT JOIN 
  `anudataanalyst.sales_data.Customers` AS customers
ON
  customers.CustomerKey = sales.CustomerKey
GROUP BY 
  Year,
  customers.Country
  
ORDER BY
  Year
