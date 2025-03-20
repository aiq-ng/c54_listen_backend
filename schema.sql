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