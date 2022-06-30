WITH Fibonacci (PrevN, N, k) AS
(
SELECT 0, 1, 0
UNION ALL
SELECT N, PrevN + N, k=k+1
FROM Fibonacci
WHERE k < 89 --(k) Количество итераций 
)
SELECT PrevN as Fibo
FROM Fibonacci
OPTION (MAXRECURSION 0);