SELECT
  DISTINCT(customer.Country),
  ROUND(SUM(Revenue),2) AS Total_Revenue
FROM(
  SELECT 
    sales.CustomerKey,
    SUM(sales.Quantity) * products.UnitPriceUSD AS Revenue,
  FROM 
    `anudataanalyst.sales_data.Sales` AS sales
  LEFT JOIN 
    `anudataanalyst.sales_data.Products` AS products
  ON
    products.ProductKey = sales.ProductKey
GROUP BY
  sales.CustomerKey,
  products.UnitPriceUSD
) prod
LEFT JOIN
  `anudataanalyst.sales_data.Customers` AS customer
ON
  prod.CustomerKey = customer.CustomerKey
GROUP BY
  customer.Country
ORDER BY
  Total_Revenue DESC
