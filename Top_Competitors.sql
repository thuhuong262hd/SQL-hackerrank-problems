SELECT h.hacker_id, h.name
FROM Hackers h
JOIN 
    (SELECT s.hacker_id AS hacker_id, COUNT(s.challenge_id) AS challenge_num
    FROM Submissions s
    JOIN Challenges c ON (s.challenge_id = c.challenge_id)
    JOIN Difficulty d ON (c.difficulty_level = d.difficulty_level) AND (s.score = d.score)
    GROUP BY s.hacker_id) cn
ON h.hacker_id = cn.hacker_id
WHERE cn.challenge_num > 1
ORDER BY cn.challenge_num DESC, h.hacker_id ASC;