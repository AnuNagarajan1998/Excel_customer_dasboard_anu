SELECT
  sales.CustomerKey,
  customers.Name,
  SUM(sales.Quantity) AS Total_sales,
  customers.Continent
FROM 
  `anudataanalyst.sales_data.Sales` AS sales
LEFT JOIN 
  `anudataanalyst.sales_data.Customers` AS customers
ON
  sales.CustomerKey = customers.CustomerKey
GROUP BY 
  sales.CustomerKey,
  customers.Name,
  customers.Continent
ORDER BY
  Total_sales DESC
