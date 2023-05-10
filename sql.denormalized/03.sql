SELECT
    t.lang AS lang,
    COUNT(*) AS count
FROM (
    SELECT DISTINCT
        data->>'id' AS id_tweets,
        data->>'lang' AS lang
    FROM tweets_jsonb
    WHERE
        data->'entities'->'hashtags'@@'$[*].text == "coronavirus"'
    UNION
    SELECT DISTINCT
        data->>'id' AS id_tweets,
        data->>'lang' AS lang
    FROM tweets_jsonb
    WHERE
        data->'extended_tweet'->'entities'->'hashtags'@@'$[*].text == "coronavirus"'
)t
GROUP BY 1
ORDER BY 2 DESC, 1
;

