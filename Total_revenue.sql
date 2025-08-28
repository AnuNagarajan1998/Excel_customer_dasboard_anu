SELECT 
  DISTINCT(sales.ProductKey),
  SUM(sales.Quantity) AS Total_sales,
  products.ProductName,
  products.UnitPriceUSD,
  SUM(sales.Quantity) * products.UnitPriceUSD AS Revenue
FROM 
  `anudataanalyst.sales_data.Sales` AS sales
LEFT JOIN 
  `anudataanalyst.sales_data.Products` AS products
ON
  products.ProductKey = sales.ProductKey
GROUP BY 
  sales.ProductKey,
  products.UnitPriceUSD,
  products.ProductName
ORDER BY
  Revenue DESC
