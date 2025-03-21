INSERT INTO listen_streams_category (name, description) VALUES
    ('Live', 'Real-time streaming events and broadcasts'),
    ('Podcast', 'On-demand audio series with episodic content'),
    ('Showcast', 'Curated shows blending live and pre-recorded elements'),
    ('Limited Series', 'Short-run audio series with a fixed number of episodes');


INSERT INTO listen_streams (category_id, name, description, thumbnail, stream_url) VALUES
    -- Live (category_id: 1)
    (1, 'Live News Update', 'Daily live updates on global news', 'https://img.freepik.com/free-vector/detailed-podcast-logo-template_23-2148786067.jpg', 'http://live.example.com/news'), -- Image1
    (1, 'Concert Stream', 'Live music performances from artists worldwide', '[Base64 JPEG 3]', 'http://live.example.com/concert'), -- Image4
    (1, 'Sports Commentary', 'Real-time commentary on major sports events', '[Base64 JPEG 1]', 'http://live.example.com/sports'), -- Image2
    -- Podcast (category_id: 2)
    (2, 'Tech Talk', 'Weekly discussions on technology trends', '[Base64 JPEG 4]', NULL), -- Image5
    (2, 'True Crime Files', 'Deep dives into unsolved mysteries', '[Base64 JPEG 2]', NULL), -- Image3
    (2, 'Health Matters', 'Expert advice on wellness and fitness', '[Base64 JPEG 1]', NULL), -- Image2
    -- Showcast (category_id: 3)
    (3, 'Morning Mix', 'A blend of live chats and pre-recorded segments', 'https://img.freepik.com/free-vector/detailed-podcast-logo-template_23-2148786067.jpg', NULL), -- Image1
    (3, 'Comedy Hour', 'Stand-up specials with live audience reactions', '[Base64 JPEG 3]', NULL), -- Image4
    -- Limited Series (category_id: 4)
    (4, 'History Unraveled', 'A 5-part series on historical events', '[Base64 JPEG 2]', NULL), -- Image3
    (4, 'Sci-Fi Tales', 'A 6-episode journey through science fiction stories', '[Base64 JPEG 4]', NULL); -- Image5

INSERT INTO listen_audio_streams (stream_id, audio_url, title, duration) VALUES
    -- Live News Update (stream_id: 1) - 4 audios
    (1, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556966/gardens-stylish-chill-303261_l43g9j.mp3', 'Breaking News: March 19', 1200), -- MP3-2
    (1, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556976/lofi-jazz-background-music-312365_fnzmh2.mp3', 'Evening Recap', 900), -- MP3-4
    (1, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556965/so-fresh-315255_fentav.mp3', 'Special Report', 1500), -- MP3-1
    (1, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556968/dont-talk-315229_say80a.mp3', 'Weather Update', 600), -- MP3-3
    -- Concert Stream (stream_id: 2) - 3 audios
    (2, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556968/dont-talk-315229_say80a.mp3', 'Rock Night Live', 3600), -- MP3-3
    (2, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556966/gardens-stylish-chill-303261_l43g9j.mp3', 'Jazz Evening', 2400), -- MP3-2
    (2, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556976/lofi-jazz-background-music-312365_fnzmh2.mp3', 'Pop Unplugged', 3000), -- MP3-4
    -- Sports Commentary (stream_id: 3) - 4 audios
    (3, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556965/so-fresh-315255_fentav.mp3', 'Football Finals', 5400), -- MP3-1
    (3, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556976/lofi-jazz-background-music-312365_fnzmh2.mp3', 'Basketball Highlights', 4800), -- MP3-4
    (3, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556968/dont-talk-315229_say80a.mp3', 'Tennis Open', 3600), -- MP3-3
    (3, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556966/gardens-stylish-chill-303261_l43g9j.mp3', 'Post-Game Analysis', 1800), -- MP3-2
    -- Tech Talk (stream_id: 4) - 5 audios
    (4, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556966/gardens-stylish-chill-303261_l43g9j.mp3', 'AI Revolution', 2100), -- MP3-2
    (4, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556965/so-fresh-315255_fentav.mp3', 'Cybersecurity Tips', 1800), -- MP3-1
    (4, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556976/lofi-jazz-background-music-312365_fnzmh2.mp3', 'Gadget Reviews', 1500), -- MP3-4
    (4, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556968/dont-talk-315229_say80a.mp3', 'Cloud Computing', 2400), -- MP3-3
    (4, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556965/so-fresh-315255_fentav.mp3', 'Future of Work', 2000), -- MP3-1
    -- True Crime Files (stream_id: 5) - 5 audios
    (5, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556976/lofi-jazz-background-music-312365_fnzmh2.mp3', 'The Vanishing', 2700), -- MP3-4
    (5, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556966/gardens-stylish-chill-303261_l43g9j.mp3', 'Cold Case #23', 3000), -- MP3-2
    (5, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556968/dont-talk-315229_say80a.mp3', 'Witness Testimony', 2400), -- MP3-3
    (5, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556965:**

so-fresh-315255_fentav.mp3', 'The Suspect', 2600), -- MP3-1
    (5, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556966/gardens-stylish-chill-303261_l43g9j.mp3', 'Final Clue', 2800), -- MP3-2
    -- Health Matters (stream_id: 6) - 4 audios
    (6, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556968/dont-talk-315229_say80a.mp3', 'Nutrition Basics', 1800), -- MP3-3
    (6, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556976/lofi-jazz-background-music-312365_fnzmh2.mp3', 'Mental Health 101', 1500), -- MP3-4
    (6, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556965/so-fresh-315255_fentav.mp3', 'Exercise Routines', 1200), -- MP3-1
    (6, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556966/gardens-stylish-chill-303261_l43g9j.mp3', 'Sleep Science', 2000), -- MP3-2
    -- Morning Mix (stream_id: 7) - 3 audios
    (7, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556965/so-fresh-315255_fentav.mp3', 'Monday Kickoff', 1800), -- MP3-1
    (7, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556968/dont-talk-315229_say80a.mp3', 'Guest Spotlight', 1500), -- MP3-3
    (7, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556976/lofi-jazz-background-music-312365_fnzmh2.mp3', 'Weekend Wrap', 1200), -- MP3-4
    -- Comedy Hour (stream_id: 8) - 3 audios
    (8, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556966/gardens-stylish-chill-303261_l43g9j.mp3', 'Live Laughs #1', 2400), -- MP3-2
    (8, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556965/so-fresh-315255_fentav.mp3', 'Improv Night', 2100), -- MP3-1
    (8, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556976/lofi-jazz-background-music-312365_fnzmh2.mp3', 'Stand-Up Special', 1800), -- MP3-4
    -- History Unraveled (stream_id: 9) - 5 audios
    (9, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556968/dont-talk-315229_say80a.mp3', 'Episode 1: Beginnings', 1800), -- MP3-3
    (9, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556966/gardens-stylish-chill-303261_l43g9j.mp3', 'Episode 2: Wars', 2100), -- MP3-2
    (9, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556976/lofi-jazz-background-music-312365_fnzmh2.mp3', 'Episode 3: Revolutions', 2000), -- MP3-4
    (9, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556965/so-fresh-315255_fentav.mp3', 'Episode 4: Discoveries', 1900), -- MP3-1
    (9, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556968/dont-talk-315229_say80a.mp3', 'Episode 5: Modern Era', 2200), -- MP3-3
    -- Sci-Fi Tales (stream_id: 10) - 6 audios
    (10, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556976/lofi-jazz-background-music-312365_fnzmh2.mp3', 'Episode 1: The Signal', 1500), -- MP3-4
    (10, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556965/so-fresh-315255_fentav.mp3', 'Episode 2: First Contact', 1800), -- MP3-1
    (10, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556966/gardens-stylish-chill-303261_l43g9j.mp3', 'Episode 3: Time Warp', 1700), -- MP3-2
    (10, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556968/dont-talk-315229_say80a.mp3', 'Episode 4: Alien Worlds', 1600), -- MP3-3
    (10, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556965/so-fresh-315255_fentav.mp3', 'Episode 5: Rebellion', 1900), -- MP3-1
    (10, 'https://res.cloudinary.com/dhnqdr351/video/upload/v1742556976/lofi-jazz-background-music-312365_fnzmh2.mp3', 'Episode 6: Finale', 2000); -- MP3-4