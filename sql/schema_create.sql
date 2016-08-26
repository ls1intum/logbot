-- The SQL schema is based on the Slack RTM API
--
-- Message: https://api.slack.com/events/message

-- Profile
CREATE TABLE IF NOT EXISTS profile (
    id SERIAL PRIMARY KEY,
    key VARCHAR(255) UNIQUE NOT NULL
);
CREATE INDEX IF NOT EXISTS profile_key_idx ON profile(key);

-- Channel
CREATE TABLE IF NOT EXISTS channel (
    id SERIAL PRIMARY KEY,
    key VARCHAR(255) UNIQUE NOT NULL
);
CREATE INDEX IF NOT EXISTS channel_key_idx ON channel(key);

-- Channel Messages
CREATE TABLE IF NOT EXISTS channel_message (
    id SERIAL PRIMARY KEY,
    author INT NOT NULL,
    channel INT NOT NULL,
    ts TIMESTAMP NOT NULL,
    content TEXT NOT NULL,

    FOREIGN KEY (channel) REFERENCES channel(ID) ON DELETE CASCADE,
    FOREIGN KEY (author) REFERENCES profile(ID) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS channel_message_channel_idx ON channel_message(channel);
CREATE INDEX IF NOT EXISTS channel_message_author_idx ON channel_message(author);
CREATE INDEX IF NOT EXISTS channel_message_ts_idx ON channel_message(ts);
