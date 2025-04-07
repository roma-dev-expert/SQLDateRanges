SELECT 
    t1.Id,
    t1.Dt AS Sd,
    t2.Dt AS Ed
FROM Dates t1
JOIN Dates t2 ON t1.Id = t2.Id AND t1.Dt < t2.Dt
WHERE NOT EXISTS (
    SELECT 1
    FROM Dates t3
    WHERE t3.Id = t1.Id AND t3.Dt > t1.Dt AND t3.Dt < t2.Dt
)
ORDER BY t1.Id, t1.Dt;
