select user_id, CONCAT(
    upper (left(name,1)),
    lower(SUBSTRING(name,2))
) as name
from Users
order by user_id;