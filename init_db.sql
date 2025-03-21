-- Table for stream categories
CREATE TABLE listen_streams_category (
    id SERIAL PRIMARY KEY,                -- Auto-incrementing unique identifier
    name VARCHAR(100) NOT NULL UNIQUE,    -- Category name, unique to avoid duplicates
    description TEXT,                     -- Description of the category
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- When the category was created
);

-- Table for stream shows
CREATE TABLE listen_streams (
    id SERIAL PRIMARY KEY,                -- Auto-incrementing unique identifier
    category_id INTEGER NOT NULL,         -- Foreign key to streams_category
    name VARCHAR(100) NOT NULL,           -- Name of the stream show
    description TEXT,                     -- Description of the show
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- When the show was created
    thumbnail VARCHAR(255) NOT NULL,      -- URL or path to the thumbnail (NOT NULL)
    stream_url VARCHAR(255),              -- URL to the stream audio/video (NULLABLE)
    CONSTRAINT fk_category                -- Foreign key constraint
        FOREIGN KEY (category_id)
        REFERENCES listen_streams_category(id)
        ON DELETE RESTRICT                -- Prevents deletion of category if linked streams exist
);

-- Table for audio streams (individual audio files)
CREATE TABLE listen_audio_streams (
    id SERIAL PRIMARY KEY,                -- Auto-incrementing unique identifier
    stream_id INTEGER NOT NULL,           -- Foreign key to streams
    audio_url VARCHAR(255) NOT NULL,      -- URL or path to the audio file
    title VARCHAR(100),                   -- Title of the audio (optional)
    duration INTEGER,                     -- Duration in seconds (optional)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- When the audio was added
    CONSTRAINT fk_stream                  -- Foreign key constraint
        FOREIGN KEY (stream_id)
        REFERENCES listen_streams(id)
        ON DELETE CASCADE                 -- Deletes audio if the parent stream is deleted
);




CREATE TABLE video_stream_categories (
    id SERIAL PRIMARY KEY,                  -- Unique identifier (auto-incrementing)
    name VARCHAR(100) NOT NULL UNIQUE,      -- Category name (e.g., "Live Sports"), unique to avoid duplicates
    description TEXT,                       -- Detailed description of the category
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- When the category was created
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- Last update timestamp
    is_active BOOLEAN DEFAULT TRUE          -- Soft delete/status flag
);

-- Index for faster lookups by name
CREATE INDEX idx_video_stream_categories_name ON video_stream_categories(name);




CREATE TABLE video_streams (
    id SERIAL PRIMARY KEY,                  -- Unique identifier
    category_id INTEGER NOT NULL,           -- Foreign key to video_stream_categories
    title VARCHAR(100) NOT NULL,            -- Stream title (e.g., "NBA Finals Live")
    description TEXT,                       -- Description of the live stream
    thumbnail_url VARCHAR(255) NOT NULL,    -- URL to the thumbnail image
    stream_url VARCHAR(255) NOT NULL,       -- URL to the live stream (e.g., HLS, RTMP)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- Creation timestamp
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- Last update timestamp
    start_time TIMESTAMP WITH TIME ZONE,    -- Scheduled start time of the live stream
    end_time TIMESTAMP WITH TIME ZONE,      -- Scheduled end time (if known)
    is_live BOOLEAN DEFAULT FALSE,          -- Indicates if the stream is currently live
    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES video_stream_categories(id)
        ON DELETE RESTRICT                  -- Prevents category deletion if streams exist
);

-- Indexes for performance
CREATE INDEX idx_video_streams_category_id ON video_streams(category_id);
CREATE INDEX idx_video_streams_is_live ON video_streams(is_live);



CREATE TABLE tv_shows (
    id SERIAL PRIMARY KEY,                  -- Unique identifier
    title VARCHAR(100) NOT NULL UNIQUE,     -- Show title (e.g., "Breaking Bad"), unique to avoid duplicates
    description TEXT,                       -- Show synopsis
    thumbnail_url VARCHAR(255) NOT NULL,    -- URL to the show’s thumbnail/poster
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- Creation timestamp
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- Last update timestamp
    release_date DATE,                      -- Original release date of the show
    season_count INTEGER DEFAULT 0,         -- Number of seasons (for tracking)
    is_active BOOLEAN DEFAULT TRUE          -- Soft delete/status flag
);

-- Index for faster lookups by title
CREATE INDEX idx_tv_shows_title ON tv_shows(title);



CREATE TABLE tv_show_videos (
    id SERIAL PRIMARY KEY,                  -- Unique identifier
    show_id INTEGER NOT NULL,               -- Foreign key to tv_shows
    title VARCHAR(100) NOT NULL,            -- Video title (e.g., "Pilot")
    description TEXT,                       -- Video description
    video_url VARCHAR(255) NOT NULL,        -- URL to the video file (e.g., MP4, HLS)
    duration INTEGER,                       -- Duration in seconds (optional but useful)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- Creation timestamp
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- Last update timestamp
    release_date TIMESTAMP WITH TIME ZONE,  -- Video release date/time
    is_published BOOLEAN DEFAULT TRUE,      -- Indicates if the video is publicly available
    CONSTRAINT fk_show
        FOREIGN KEY (show_id)
        REFERENCES tv_shows(id)
        ON DELETE CASCADE                   -- Deletes videos if the show is deleted
);

-- Index for performance
CREATE INDEX idx_tv_show_videos_show_id ON tv_show_videos(show_id);



CREATE TABLE c54_shorts (
    id SERIAL PRIMARY KEY,                  -- Unique identifier
    title VARCHAR(100) NOT NULL,            -- Short video title (e.g., "Breaking News: Storm Update")
    description TEXT,                       -- Brief description
    video_url VARCHAR(255) NOT NULL,        -- URL to the short video file
    duration INTEGER,                       -- Duration in seconds (optional, typically short)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- Creation timestamp
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- Last update timestamp
    publish_date TIMESTAMP WITH TIME ZONE,  -- When the short was published
    view_count BIGINT DEFAULT 0,            -- Tracks views (common for shorts)
    is_active BOOLEAN DEFAULT TRUE,         -- Soft delete/status flag
    CONSTRAINT chk_duration CHECK (duration <= 300)  -- Ensures shorts are ≤ 5 minutes (300s)
);

-- Index for faster sorting by publish date
CREATE INDEX idx_c54_shorts_publish_date ON c54_shorts(publish_date);


