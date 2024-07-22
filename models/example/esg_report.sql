WITH esg_report AS (SELECT
    c.CompanyName,
    c.Industry,
    c.Headquarters,
    em.Year,
    em.CarbonEmissions,
    em.EnergyConsumption,
    em.WasteGenerated,
    sgm.EmployeeTurnover,
    sgm.DiversityScore,
    sgm.BoardIndependence
FROM
    Companies c
RIGHT JOIN
    EnvironmentalMetrics em ON c.CompanyID = em.CompanyID
RIGHT JOIN
    SocialGovernanceMetrics sgm ON c.CompanyID = sgm.CompanyID AND em.Year = sgm.YEAR)
    
SELECT companyname, industry, headquarters, YEAR, carbonemissions, 
 energyconsumption,wastegenerated, employeeturnover, diversityscore,boardindependence 
 FROM esg_report