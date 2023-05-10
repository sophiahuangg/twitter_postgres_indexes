CREATE INDEX CONCURRENTLY tweets_full_text_idx ON tweets_jsonb USING gin(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')));

CREATE INDEX CONCURRENTLY tweets_hashtags_idx ON tweets_jsonb USING gin((data->'entities'->'hashtags'));

CREATE INDEX CONCURRENTLY tweets_extended_hashtags_idx ON tweets_jsonb USING gin((data->'extended_tweet'->'entities'->'hashtags'));

