INSERT INTO listen_streams_category (name, description) VALUES
    ('Live', 'Real-time streaming events and broadcasts'),
    ('Podcast', 'On-demand audio series with episodic content'),
    ('Showcast', 'Curated shows blending live and pre-recorded elements'),
    ('Limited Series', 'Short-run audio series with a fixed number of episodes');


INSERT INTO listen_streams (category_id, name, description, thumbnail, stream_url) VALUES
    -- Live (category_id: 1)
    (1, 'Live News Update', 'Daily live updates on global news', 'live_news_thumbnail.jpg', 'http://live.example.com/news'),
    (1, 'Concert Stream', 'Live music performances from artists worldwide', 'concert_thumbnail.jpg', 'http://live.example.com/concert'),
    (1, 'Sports Commentary', 'Real-time commentary on major sports events', 'sports_thumbnail.jpg', 'http://live.example.com/sports'),
    -- Podcast (category_id: 2)
    (2, 'Tech Talk', 'Weekly discussions on technology trends', 'tech_thumbnail.jpg', NULL),
    (2, 'True Crime Files', 'Deep dives into unsolved mysteries', 'crime_thumbnail.jpg', NULL),
    (2, 'Health Matters', 'Expert advice on wellness and fitness', 'health_thumbnail.jpg', NULL),
    -- Showcast (category_id: 3)
    (3, 'Morning Mix', 'A blend of live chats and pre-recorded segments', 'morning_thumbnail.jpg', NULL),
    (3, 'Comedy Hour', 'Stand-up specials with live audience reactions', 'comedy_thumbnail.jpg', NULL),
    -- Limited Series (category_id: 4)
    (4, 'History Unraveled', 'A 5-part series on historical events', 'history_thumbnail.jpg', NULL),
    (4, 'Sci-Fi Tales', 'A 6-episode journey through science fiction stories', 'scifi_thumbnail.jpg', NULL);


INSERT INTO listen_audio_streams (stream_id, audio_url, title, duration) VALUES
    -- Live News Update (stream_id: 1) - 4 audios
    (1, 'https://example.com/live/news1.mp3', 'Breaking News: March 19', 1200),
    (1, 'https://example.com/live/news2.mp3', 'Evening Recap', 900),
    (1, 'https://example.com/live/news3.mp3', 'Special Report', 1500),
    (1, 'https://example.com/live/news4.mp3', 'Weather Update', 600),
    -- Concert Stream (stream_id: 2) - 3 audios
    (2, 'https://example.com/live/concert1.mp3', 'Rock Night Live', 3600),
    (2, 'https://example.com/live/concert2.mp3', 'Jazz Evening', 2400),
    (2, 'https://example.com/live/concert3.mp3', 'Pop Unplugged', 3000),
    -- Sports Commentary (stream_id: 3) - 4 audios
    (3, 'https://example.com/live/sports1.mp3', 'Football Finals', 5400),
    (3, 'https://example.com/live/sports2.mp3', 'Basketball Highlights', 4800),
    (3, 'https://example.com/live/sports3.mp3', 'Tennis Open', 3600),
    (3, 'https://example.com/live/sports4.mp3', 'Post-Game Analysis', 1800),
    -- Tech Talk (stream_id: 4) - 5 audios
    (4, 'https://example.com/podcast/tech1.mp3', 'AI Revolution', 2100),
    (4, 'https://example.com/podcast/tech2.mp3', 'Cybersecurity Tips', 1800),
    (4, 'https://example.com/podcast/tech3.mp3', 'Gadget Reviews', 1500),
    (4, 'https://example.com/podcast/tech4.mp3', 'Cloud Computing', 2400),
    (4, 'https://example.com/podcast/tech5.mp3', 'Future of Work', 2000),
    -- True Crime Files (stream_id: 5) - 5 audios
    (5, 'https://example.com/podcast/crime1.mp3', 'The Vanishing', 2700),
    (5, 'https://example.com/podcast/crime2.mp3', 'Cold Case #23', 3000),
    (5, 'https://example.com/podcast/crime3.mp3', 'Witness Testimony', 2400),
    (5, 'https://example.com/podcast/crime4.mp3', 'The Suspect', 2600),
    (5, 'https://example.com/podcast/crime5.mp3', 'Final Clue', 2800),
    -- Health Matters (stream_id: 6) - 4 audios
    (6, 'https://example.com/podcast/health1.mp3', 'Nutrition Basics', 1800),
    (6, 'https://example.com/podcast/health2.mp3', 'Mental Health 101', 1500),
    (6, 'https://example.com/podcast/health3.mp3', 'Exercise Routines', 1200),
    (6, 'https://example.com/podcast/health4.mp3', 'Sleep Science', 2000),
    -- Morning Mix (stream_id: 7) - 3 audios
    (7, 'https://example.com/showcast/mix1.mp3', 'Monday Kickoff', 1800),
    (7, 'https://example.com/showcast/mix2.mp3', 'Guest Spotlight', 1500),
    (7, 'https://example.com/showcast/mix3.mp3', 'Weekend Wrap', 1200),
    -- Comedy Hour (stream_id: 8) - 3 audios
    (8, 'https://example.com/showcast/comedy1.mp3', 'Live Laughs #1', 2400),
    (8, 'https://example.com/showcast/comedy2.mp3', 'Improv Night', 2100),
    (8, 'https://example.com/showcast/comedy3.mp3', 'Stand-Up Special', 1800),
    -- History Unraveled (stream_id: 9) - 5 audios
    (9, 'https://example.com/series/history1.mp3', 'Episode 1: Beginnings', 1800),
    (9, 'https://example.com/series/history2.mp3', 'Episode 2: Wars', 2100),
    (9, 'https://example.com/series/history3.mp3', 'Episode 3: Revolutions', 2000),
    (9, 'https://example.com/series/history4.mp3', 'Episode 4: Discoveries', 1900),
    (9, 'https://example.com/series/history5.mp3', 'Episode 5: Modern Era', 2200),
    -- Sci-Fi Tales (stream_id: 10) - 6 audios
    (10, 'https://example.com/series/scifi1.mp3', 'Episode 1: The Signal', 1500),
    (10, 'https://example.com/series/scifi2.mp3', 'Episode 2: First Contact', 1800),
    (10, 'https://example.com/series/scifi3.mp3', 'Episode 3: Time Warp', 1700),
    (10, 'https://example.com/series/scifi4.mp3', 'Episode 4: Alien Worlds', 1600),
    (10, 'https://example.com/series/scifi5.mp3', 'Episode 5: Rebellion', 1900),
    (10, 'https://example.com/series/scifi6.mp3', 'Episode 6: Finale', 2000);