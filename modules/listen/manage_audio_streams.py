from ..shared.connect_db import Db_connection
from .utils import ManageAudio, ManageImageUpload

db_connection = Db_connection()

class Manage_streams():
    def __init__(self):
        pass
    def create_stream_category(self, request_data):
        conn = db_connection.get_db_connection()

        if not conn:
            return {"error": "Database connection failed"}

        try:
            cursor = conn.cursor()

            # Sanitize input and build the query safely.
            name = request_data.name
            description = request_data.description

            query = "INSERT INTO listen_streams_category (name, description) VALUES (%s, %s)"

            cursor.execute(query, (name, description))

            conn.commit()  # Commit the transaction to save changes.

            return {"message": "Stream category created successfully"}

        except Exception as e:
            conn.rollback()  # Rollback changes if an error occurred.
            return {"error": f"Error creating stream category: {str(e)}"}

        finally:
            if conn:
                cursor.close()
                conn.close()
  
    def get_stream_category(self):
        conn = db_connection.get_db_connection()

        if not conn:
            return {"error": "Database connection failed"}

        try:
            cursor = conn.cursor()

            query = "SELECT * FROM listen_streams_category;"

            cursor.execute(query)

            rows = cursor.fetchall() 

            live = [dict(row) for row in rows]
            return {"data": live}

        except Exception as e: 
            return {"error": f"there was an error getting podcast: {str(e)}"}  
        
        finally:
            if conn:
                cursor.close()
                conn.close()
        

    def create_stream(self, category_id, name, description, thumbnail, stream_url):
        conn = db_connection.get_db_connection()
        print('creating stream')

        if not conn:
            return {"error": "Database connection failed"}
        
        try:
            print('uploading thumbnail')
            thumbnail_image = ManageImageUpload.upload_image(thumbnail.file)
            print('thumbnail upload response', thumbnail_image)
        except Exception as e:
            return {"error": f"there was a problem uploading image: {str(e)}"}

        try:
            print("saving data to db")
            cursor = conn.cursor()

            # Sanitize input and build the query safely.
            category_id = category_id
            name = name
            description = description
            thumbnail = thumbnail_image['secure_url']
            stream_url = stream_url

            query = "INSERT INTO listen_streams (category_id, name, description, thumbnail, stream_url) VALUES (%s, %s, %s, %s, %s)"
            print(query)
            cursor.execute(query, (category_id, name, description, thumbnail, stream_url))

            conn.commit()  # Commit the transaction to save changes.

            return True

        except Exception as e:
            conn.rollback()  # Rollback changes if an error occurred.
            return {"error": f"Error creating stream category: {str(e)}"}

        finally:
            if conn:
                cursor.close()
                conn.close()
        
    def get_stream(self):
        try:
            conn = db_connection.get_db_connection()

        except Exception as e:
            return {"error": f"Database connection failed {str(e)}"}

        try:
            cursor = conn.cursor()

            query = "SELECT * FROM listen_streams;"

            cursor.execute(query)

            rows = cursor.fetchall() 

            live = [dict(row) for row in rows]
            return {"data": live}

        except Exception as e: 
            return {"error": f"there was an error getting streams: {str(e)}"}  
        
        finally:
            if conn:
                cursor.close()
                conn.close()
        

    def upload_audio(self, stream_id, title, duration, audio):
        conn = db_connection.get_db_connection()

        if not conn:
            return {"error": "Database connection failed"}

        try:
            audio = ManageAudio.uploadBasic(audio.file)
        except Exception as e:
            return {"error": f"error uploading video: {str(e)}"}

        try:
            cursor = conn.cursor()

            # Sanitize input and build the query safely.
            stream_id = stream_id
            audio_url = audio['secure_url']
            title = title
            duration = duration

            query = "INSERT INTO listen_audio_streams (stream_id, audio_url, title, duration) VALUES (%s, %s, %s, %s)"

            cursor.execute(query, (stream_id, audio_url, title, duration))

            conn.commit()  # Commit the transaction to save changes.

            return audio_url

        except Exception as e:
            conn.rollback()  # Rollback changes if an error occurred.
            return {"error": f"audio uploaded successfully stream category: {str(e)}"}

        finally:
            if conn:
                cursor.close()
                conn.close()

    def get_stream_audio(self, stream_id):
        conn = db_connection.get_db_connection()

        if not conn:
            return {"error": "Database connection failed"}

        try:
            cursor = conn.cursor()

            query = f"SELECT * FROM listen_audio_streams where stream_id={stream_id};"

            cursor.execute(query)

            rows = cursor.fetchall() 

            live = [dict(row) for row in rows]
            return {"data": live}

        except Exception as e: 
            return {"error": f"there was an error getting streams: {str(e)}"}  
        
        finally:
            if conn:
                cursor.close()
                conn.close()
      

    def get_new_episodes(self):
        conn = db_connection.get_db_connection()

        if not conn:
            return {"error": "Database connection failed"}

        try:
            cursor = conn.cursor()

            query = """SELECT 
                    ls.name AS stream_name,
                    ls.thumbnail,
                    las.audio_url,
                    las.title AS audio_title,
                    las.duration,
                    las.created_at AS audio_created_at
                        FROM 
                            listen_audio_streams las
                        JOIN 
                            listen_streams ls ON las.stream_id = ls.id
                        ORDER BY 
                            las.created_at DESC
                        LIMIT 5;"""

            cursor.execute(query)

            rows = cursor.fetchall() 

            live = [dict(row) for row in rows]
            return {"data": live}

        except Exception as e: 
            return {"error": f"there was an error getting streams: {str(e)}"}  
        
        finally:
            if conn:
                cursor.close()
                conn.close()


    def get_all_categories_with_streams(self):
        conn = db_connection.get_db_connection()
        if not conn:
            return {"error": "Database connection failed"}

        try:
            cursor = conn.cursor()
            query = """
                SELECT 
                    json_build_object(
                        'id', c.id,
                        'name', c.name,
                        'description', c.description,
                        'created_at', c.created_at,
                        'streams', COALESCE(
                            json_agg(
                                json_build_object(
                                    'id', s.id,
                                    'category_id', s.category_id,
                                    'name', s.name,
                                    'description', s.description,
                                    'created_at', s.created_at,
                                    'thumbnail', s.thumbnail,
                                    'stream_url', s.stream_url
                                )
                            ) FILTER (WHERE s.id IS NOT NULL),
                            '[]'::json
                        )
                    ) AS category
                FROM listen_streams_category c
                LEFT JOIN listen_streams s ON c.id = s.category_id
                GROUP BY c.id, c.name, c.description, c.created_at;
            """
            cursor.execute(query)
            results = cursor.fetchall()

            # Extract the 'category' JSON object from each row
            categories = [row["category"] for row in results]
            return categories

        except Exception as e:
            return {"error": f"Query failed: {str(e)}"}
        finally:
            if cursor:
                cursor.close()
            if conn:
                conn.close()
            

    def get_stream_with_audio(self, stream_id: int):
        conn = db_connection.get_db_connection()
        if not conn:
            return {"error": "Database connection failed"}

        try:
            cursor = conn.cursor()
            query = """
                SELECT 
                    json_build_object(
                        'id', s.id,
                        'category_id', s.category_id,
                        'name', s.name,
                        'description', s.description,
                        'created_at', s.created_at,
                        'thumbnail', s.thumbnail,
                        'stream_url', s.stream_url,
                        'audio_streams', COALESCE(
                            json_agg(
                                json_build_object(
                                    'id', a.id,
                                    'stream_id', a.stream_id,
                                    'audio_url', a.audio_url,
                                    'title', a.title,
                                    'duration', a.duration,
                                    'created_at', a.created_at
                                )
                            ) FILTER (WHERE a.id IS NOT NULL),
                            '[]'::json
                        )
                    ) AS stream
                FROM listen_streams s
                LEFT JOIN listen_audio_streams a ON s.id = a.stream_id
                WHERE s.id = %s
                GROUP BY s.id, s.category_id, s.name, s.description, s.created_at, s.thumbnail, s.stream_url;
            """
            cursor.execute(query, (stream_id,))
            result = cursor.fetchone()

            if result:
                return result["stream"]
            else:
                return {"error": "Stream not found"}

        except Exception as e:
            return {"error": f"Query failed: {str(e)}"}
        finally:
            if cursor:
                cursor.close()
            if conn:
                conn.close()


    def get_popular_podcasts(limit: int = 5):
        conn = Db_connection.get_db_connection()
        if not conn:
            return {"error": "Database connection failed"}

        try:
            cursor = conn.cursor()
            query = """
                SELECT 
                    json_build_object(
                        'id', s.id,
                        'category_id', s.category_id,
                        'category_name', c.name,
                        'name', s.name,
                        'description', s.description,
                        'created_at', s.created_at,
                        'thumbnail', s.thumbnail,
                        'stream_url', s.stream_url,
                        'audio_count', COUNT(a.id),
                        'audio_streams', COALESCE(
                            json_agg(
                                json_build_object(
                                    'id', a.id,
                                    'audio_url', a.audio_url,
                                    'title', a.title,
                                    'duration', a.duration,
                                    'created_at', a.created_at
                                )
                            ) FILTER (WHERE a.id IS NOT NULL),
                            '[]'::json
                        )
                    ) AS podcast
                FROM listen_streams s
                JOIN listen_streams_category c ON s.category_id = c.id
                LEFT JOIN listen_audio_streams a ON s.id = a.stream_id
                GROUP BY s.id, s.category_id, s.name, s.description, s.created_at, s.thumbnail, s.stream_url, c.name
                ORDER BY COUNT(a.id) DESC
                LIMIT %s;
            """
            cursor.execute(query, (limit,))
            results = cursor.fetchall()

            # Extract the 'podcast' JSON object from each row
            podcasts = [row["podcast"] for row in results]
            return podcasts

        except Exception as e:
            return {"error": f"Query failed: {str(e)}"}
        finally:
            if cursor:
                cursor.close()
            if conn:
                conn.close()



