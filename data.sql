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






    INSERT INTO video_stream_categories (name, description, is_active) VALUES
    ('Breaking News', 'Live coverage of urgent news events', TRUE),
    ('Network TV Channel', 'C54’s flagship live channel programming', TRUE),
    ('Politics', 'Political news and analysis', TRUE),
    ('World Events', 'Global news and international stories', TRUE),
    ('Business', 'Financial markets and economic updates', TRUE);



    INSERT INTO video_streams (category_id, title, description, thumbnail_url, stream_url, start_time, is_live) VALUES
    -- Breaking News (category_id: 1)
    (1, 'C54 Breaking News: Storm Coverage', 'Live updates on a major storm', 'https://example.com/storm_thumb.jpg', 'https://example.com/storm/stream', '2025-03-20 08:00:00+00', TRUE),
    (1, 'C54 Breaking News: Election Results', 'Real-time election updates', 'https://example.com/election_thumb.jpg', 'https://example.com/election/stream', '2025-03-20 20:00:00+00', FALSE),
    -- Network TV Channel (category_id: 2)
    (2, 'C54 Network Live', 'C54’s main live news feed', 'https://example.com/c54live_thumb.jpg', 'https://example.com/c54live/stream', '2025-03-20 00:00:00+00', TRUE),
    (2, 'C54 Evening News', 'Daily evening news roundup', 'https://example.com/evening_thumb.jpg', 'https://example.com/evening/stream', '2025-03-20 18:00:00+00', FALSE),
    -- Politics (category_id: 3)
    (3, 'C54 Politics Live: Debate Night', 'Live political debate coverage', 'https://example.com/debate_thumb.jpg', 'https://example.com/debate/stream', '2025-03-21 19:00:00+00', FALSE),
    -- World Events (category_id: 4)
    (4, 'C54 World: Ukraine Update', 'Live reports from Ukraine', 'https://example.com/ukraine_thumb.jpg', 'https://example.com/ukraine/stream', '2025-03-22 12:00:00+00', TRUE),
    (4, 'C54 World: Climate Summit', 'Live from the global summit', 'https://example.com/climate_thumb.jpg', 'https://example.com/climate/stream', '2025-03-23 14:00:00+00', FALSE),
    -- Business (category_id: 5)
    (5, 'C54 Business: Market Open', 'Live stock market opening', 'https://example.com/market_thumb.jpg', 'https://example.com/market/stream', '2025-03-24 13:30:00+00', TRUE);



    INSERT INTO tv_shows (title, description, thumbnail_url, release_date, season_count, is_active) VALUES
    ('C54 Tonight with Jane Doe', 'Nightly news and interviews', 'https://example.com/c54tonight_thumb.jpg', '2023-01-10', 3, TRUE),
    ('C54 Global Brief', 'In-depth global news analysis', 'https://example.com/globalbrief_thumb.jpg', '2022-06-15', 2, TRUE),
    ('C54 Money Matters', 'Business and finance insights', 'https://example.com/money_thumb.jpg', '2021-09-01', 4, TRUE),
    ('C54 Inside Politics', 'Political news and commentary', 'https://example.com/politics_thumb.jpg', '2020-03-05', 5, TRUE),
    ('C54 Spotlight', 'Investigative journalism specials', 'https://example.com/spotlight_thumb.jpg', '2019-11-20', 6, TRUE);


    INSERT INTO tv_show_videos (show_id, title, description, video_url, duration, release_date, is_published) VALUES
    -- C54 Tonight with Jane Doe (show_id: 1)
    (1, 'March 20 Recap', 'Top stories of the day', 'https://example.com/c54tonight_mar20.mp4', 3600, '2025-03-20 22:00:00+00', TRUE),
    (1, 'Interview: Senator Smith', 'Exclusive political interview', 'https://example.com/c54tonight_smith.mp4', 3000, '2025-03-19 22:00:00+00', TRUE),
    (1, 'Storm Aftermath', 'Reporting on storm recovery', 'https://example.com/c54tonight_storm.mp4', 3300, '2025-03-18 22:00:00+00', TRUE),
    -- C54 Global Brief (show_id: 2)
    (2, 'Ukraine Crisis Update', 'Latest from the frontlines', 'https://example.com/global_ukraine.mp4', 2700, '2025-03-20 15:00:00+00', TRUE),
    (2, 'Climate Change Special', 'Impact of global warming', 'https://example.com/global_climate.mp4', 3000, '2025-03-13 15:00:00+00', TRUE),
    -- C54 Money Matters (show_id: 3)
    (3, 'Stock Market Crash?', 'Analyzing market trends', 'https://example.com/money_crash.mp4', 2400, '2025-03-20 17:00:00+00', TRUE),
    (3, 'Crypto Boom', 'Cryptocurrency surge explained', 'https://example.com/money_crypto.mp4', 2600, '2025-03-19 17:00:00+00', TRUE),
    (3, 'Interest Rates Rise', 'Federal Reserve update', 'https://example.com/money_rates.mp4', 2500, '2025-03-18 17:00:00+00', TRUE),
    -- C54 Inside Politics (show_id: 4)
    (4, 'Election Preview', 'Breaking down the candidates', 'https://example.com/politics_election.mp4', 3600, '2025-03-20 20:00:00+00', TRUE),
    (4, 'Congress Standoff', 'Budget debate analysis', 'https://example.com/politics_congress.mp4', 3400, '2025-03-19 20:00:00+00', TRUE),
    (4, 'Policy Impact', 'New law effects', 'https://example.com/politics_policy.mp4', 3200, '2025-03-18 20:00:00+00', TRUE),
    -- C54 Spotlight (show_id: 5)
    (5, 'Corruption Exposed', 'Investigating government fraud', 'https://example.com/spotlight_corruption.mp4', 4200, '2025-03-20 21:00:00+00', TRUE),
    (5, 'Health Crisis', 'Hospital system failures', 'https://example.com/spotlight_health.mp4', 4000, '2025-03-13 21:00:00+00', TRUE),
    (5, 'Cybersecurity Breaches', 'Major data leaks', 'https://example.com/spotlight_cyber.mp4', 3800, '2025-03-06 21:00:00+00', TRUE),
    (5, 'Climate Refugees', 'Migration due to floods', 'https://example.com/spotlight_refugees.mp4', 3900, '2025-02-27 21:00:00+00', TRUE);


    INSERT INTO c54_shorts (title, description, video_url, duration, publish_date, view_count) VALUES
    ('C54 Short: Storm Hits Coast', 'Hurricane makes landfall', 'https://example.com/short_storm.mp4', 60, '2025-03-20 08:30:00+00', 2500),
    ('C54 Short: Election Poll', 'Latest voter trends', 'https://example.com/short_poll.mp4', 45, '2025-03-20 09:00:00+00', 1800),
    ('C54 Short: Market Drop', 'Stocks plunge 500 points', 'https://example.com/short_market.mp4', 30, '2025-03-20 10:15:00+00', 3000),
    ('C54 Short: Ukraine Strike', 'Missile attack reported', 'https://example.com/short_ukraine.mp4', 75, '2025-03-20 11:30:00+00', 2200),
    ('C54 Short: Fed Rate Hike', 'Interest rates up 0.5%', 'https://example.com/short_fed.mp4', 50, '2025-03-20 13:00:00+00', 1500),
    ('C54 Short: Climate Protest', 'Activists block roads', 'https://example.com/short_protest.mp4', 60, '2025-03-20 14:45:00+00', 900),
    ('C54 Short: Tech Outage', 'Major app crashes', 'https://example.com/short_outage.mp4', 40, '2025-03-20 16:00:00+00', 1200),
    ('C54 Short: Health Alert', 'New virus strain detected', 'https://example.com/short_health.mp4', 90, '2025-03-20 17:15:00+00', 600),
    ('C54 Short: Space Launch', 'Rocket lifts off', 'https://example.com/short_space.mp4', 55, '2025-03-20 18:30:00+00', 2000),
    ('C54 Short: Court Ruling', 'Landmark decision made', 'https://example.com/short_court.mp4', 70, '2025-03-20 19:45:00+00', 1100);

