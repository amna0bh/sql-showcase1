-- Ovdje, tražim accounte sa failed attempts (neuspjelim pokušajima za login)
SELECT u.username, COUNT(*) AS failed_attempts
FROM login_attempts l
JOIN users u ON l.user_id = u.user_id
WHERE success = FALSE
GROUP BY u.username;

-- Ovdje, tražim nepoznate IP adrese koje su pokusale login

SELECT ip_address, COUNT(*) AS failed_attempts
FROM security_log_analysis.login_attempts
WHERE success = FALSE
GROUP BY ip_address
ORDER BY failed_attempts DESC;

-- Zatim, gledam logins iz država gdje su oni pokušani
SELECT u.username, l.country, l.login_time
FROM login_attempts l
JOIN users u ON l.user_id = u.user_id
WHERE l.country IN ('Russia','China');

-- Provjeravamo koji device koristi attacker

SELECT d.device_type, COUNT(*) AS failed_attempts
FROM login_attempts l
JOIN devices d ON l.devices_id = d.device_id
WHERE success = FALSE
GROUP BY d.device_type;

-- Onda detektujem brute force napade
SELECT u.username, COUNT(*) AS failed_attempts
FROM login_attempts left
JOIN users u ON l.user_id = u.user_id
WHERE success = FALSE
GROUP BY u.username 
HAVING COUNT(*) >= 2
ORDER BY failed_attempts DESC;


-- Provjeravam koji useri iz vise država se pokušavaju ulogovati, VPN
SELECT u.username, COUNT(DISTINCT country) AS countries_used
FROM login_attempts l 
JOIN users u ON l.user_id = u.user_id
GROUP BY u.username
HAVING COUNT(DISTINCT country) > 1;

-- Pronalazim IPs koje pokušavaju više profila da 'attackuju' (da se loginuju u njih)

SELECT ip_address, COUNT(DISTINCT user_id) AS targeted_accounts
FROM login_attempts 
WHERE success = FALSE
GROUP BY ip_address
HAVING COUNT(DISTINCT user_id) > 1
ORDER BY targeted_accounts DESC;
