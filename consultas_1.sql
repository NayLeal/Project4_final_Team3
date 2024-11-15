-- Precio Promedio por Vecindario
SELECT p.Neighborhood, AVG(s.SalePrice) AS Avg_SalePrice
FROM sales s
JOIN properties p ON s.property_id = p.property_id
GROUP BY p.Neighborhood
ORDER BY Avg_SalePrice DESC;
--Área Total del Lote y Precio de Venta Promedio
SELECT l.Lot_Area, AVG(s.SalePrice) AS Avg_SalePrice
FROM lots l
JOIN sales s ON l.property_id = s.property_id
GROUP BY l.Lot_Area
ORDER BY Avg_SalePrice DESC;
-- Relación entre Número de Chimeneas y Precio de Venta
SELECT e.Fireplaces, AVG(s.SalePrice) AS Avg_SalePrice
FROM extra_features e
JOIN sales s ON e.property_id = s.property_id
GROUP BY e.Fireplaces
ORDER BY Avg_SalePrice DESC;
-- Promedio del Precio de Venta Según la Calidad Exterior
SELECT c.Exter_Qual, AVG(s.SalePrice) AS Avg_SalePrice
FROM construction c
JOIN sales s ON c.property_id = s.property_id
GROUP BY c.Exter_Qual
ORDER BY Avg_SalePrice DESC;
-- Conteo de Tipos de Propiedades por Condición General
SELECT 
    p.Bldg_Type,
    p.Overall_Cond,
    COUNT(*) AS Count_Properties
FROM 
    properties p
GROUP BY 
    p.Bldg_Type, p.Overall_Cond
ORDER BY 
    p.Bldg_Type, p.Overall_Cond;
--Análisis de Amenidades de Propiedades Vendidas
SELECT 
    COUNT(*) AS Total_Properties,
    SUM(CASE WHEN ef.Fireplaces > 0 THEN 1 ELSE 0 END) AS With_Fireplace,
    SUM(CASE WHEN ef.Pool_Area > 0 THEN 1 ELSE 0 END) AS With_Pool,
    SUM(CASE WHEN ef.Garage_Cars > 0 THEN 1 ELSE 0 END) AS With_Garage
FROM 
    extra_features ef;
--Análisis de Renovación de Propiedades
SELECT 
    p.property_id,
    p.Year_Built,
    p.Year_Remod_Add,
    CASE 
        WHEN p.Year_Remod_Add > p.Year_Built THEN 'Renovated'
        ELSE 'Original'
    END AS Renovation_Status
FROM 
    properties p;
