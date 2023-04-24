select N,'Root' from bst where P is null
 
UNION

select N,'Inner'from bst 

Except
(select N,'Inner' from bst where P is null)
Except
(SELECT N,'Inner'FROM BST 
EXCEPT
SELECT DISTINCT P,'Inner' FROM BST
WHERE P IS NOT NULL)

Union
SELECT N,'Leaf'FROM BST 
EXCEPT
SELECT DISTINCT P,'Leaf' FROM BST
WHERE P IS NOT NULL
order by N asc
