from ..shared.connect_db import Db_connection
from .utils import ManageAudio, ManageImageUpload
from fastapi import status, HTTPException
from modules.shared.response import Response

db_connection = Db_connection()

class Manage_streams():
    def __init__(self):
        pass
    def create_video_stream_category(self, request_data):
        conn = db_connection.get_db_connection()

        if not conn:
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail="database connection failed"
            )

        try:
            cursor = conn.cursor()

            # Sanitize input and build the query safely.
            name = request_data.name
            description = request_data.description

            query = "INSERT INTO video_stream_categories (name, description) VALUES (%s, %s)"

            cursor.execute(query, (name, description))
            print(f"Rows affected: {cursor.rowcount}")

            conn.commit()  # Commit the transaction to save changes.

            return True

        except Exception as e:
            conn.rollback()  # Rollback changes if an error occurred.
            print(f"Error: {str(e)}")
            return {"error": f"Error creating stream category: {str(e)}"}

        finally:
            if conn:
                cursor.close()
                conn.close()
  
    def get_video_stream_category(self):
        conn = db_connection.get_db_connection()

        if not conn:
            return {"error": "Database connection failed"}

        try:
            cursor = conn.cursor()

            query = "SELECT * FROM video_stream_categories;"

            cursor.execute(query)

            rows = cursor.fetchall() 

            live = [dict(row) for row in rows]
            return live

        except Exception as e: 
            return {"error": f"there was an error getting podcast: {str(e)}"}  
        
        finally:
            if conn:
                cursor.close()
                conn.close()
        

    def create_video_stream(self, category_id, title, description, thumbnail, stream_url):
        conn = db_connection.get_db_connection()

        if not conn:
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail="database connection failed"
            )
        
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
            title = title
            description = description
            thumbnail_url = thumbnail_image['secure_url']
            stream_url = stream_url

            query = "INSERT INTO video_streams (category_id, title, description, thumbnail_url, stream_url) VALUES (%s, %s, %s, %s, %s)"
            print(query)
            cursor.execute(query, (category_id, title, description, thumbnail_url, stream_url))

            if cursor.rowcount == 0:
                raise Exception("No rows were inserted")

            conn.commit()  # Commit the transaction to save changes.

            return True

        except Exception as e:
            conn.rollback()  # Rollback changes if an error occurred.
            print(f"error: {str(e)}")
            return {"error": f"Error creating stream category: {str(e)}"}

        finally:
            if conn:
                cursor.close()
                conn.close()

        
    def get_video_stream(self):
        try:
            conn = db_connection.get_db_connection()

        except Exception as e:
            return Response.error(status.HTTP_500_INTERNAL_SERVER_ERROR, f"Database connection failed {str(e)}")

        try:
            cursor = conn.cursor()

            query = "SELECT * FROM video_streams;"

            cursor.execute(query)

            rows = cursor.fetchall() 

            live = [dict(row) for row in rows]
            return live

        except Exception as e: 
            return Response.error(status.HTTP_500_INTERNAL_SERVER_ERROR, f"There was an error getting streams {str(e)}")
        
        finally:
            if conn:
                cursor.close()
                conn.close()
    


    def create_tv_show(self, title, description, thumbnail):
        conn = db_connection.get_db_connection()

        if not conn:
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail="database connection failed"
            )
        
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
            title = title
            description = description
            thumbnail_url = thumbnail_image['secure_url']

            query = "INSERT INTO tv_shows (title, description, thumbnail_url) VALUES (%s, %s, %s)"
            print(query)
            cursor.execute(query, (title, description, thumbnail_url))

            if cursor.rowcount == 0:
                raise Exception("No rows were inserted")

            conn.commit()  # Commit the transaction to save changes.

            return True
        except Exception as e:
            conn.rollback()  # Rollback changes if an error occurred.
            print(f"error: {str(e)}")
            return {"error": f"Error creating stream category: {str(e)}"}

        finally:
            if conn:
                cursor.close()
                conn.close()
    
    def get_show_with_videos(self, show_id: int):
        conn = db_connection.get_db_connection()
        if not conn:
            return {"error": "Database connection failed"}

        try:
            cursor = conn.cursor()
            query = """
                SELECT 
                    json_build_object(
                        'id', t.id,
                        'title', t.title,
                        'description', t.description,
                        'thumbnail_url', t.thumbnail_url,
                        'created_at', t.created_at,
                        'updated_at', t.updated_at,
                        'release_date', t.release_date,
                        'season_count', t.season_count,
                        'is_active', t.is_active,
                        'videos', COALESCE(
                            json_agg(
                                json_build_object(
                                    'id', v.id,
                                    'title', v.title,
                                    'description', v.description,
                                    'video_url', v.video_url,
                                    'duration', v.duration,
                                    'created_at', v.created_at,
                                    'updated_at', v.updated_at,
                                    'release_date', v.release_date,
                                    'is_published', v.is_published
                                )
                            ) FILTER (WHERE v.id IS NOT NULL), 
                            '[]'::json
                        )
                    ) AS show
                FROM tv_shows t
                LEFT JOIN tv_show_videos v ON t.id = v.show_id
                WHERE t.id = %s
                GROUP BY t.id, t.title, t.description, t.thumbnail_url, t.created_at, t.updated_at, t.release_date, t.season_count, t.is_active;
            """
            cursor.execute(query, (show_id,))
            result = cursor.fetchone()
            
            if result:
                return result["show"]
            else:
                return {"error": "Show not found"}

        except Exception as e:
            return {"error": f"Query failed: {str(e)}"}
        finally:
            if cursor:
                cursor.close()
            if conn:
                conn.close()


    def get_all_tv_show(self):
        try:
            conn = db_connection.get_db_connection()

        except Exception as e:
            return Response.error(status.HTTP_500_INTERNAL_SERVER_ERROR, f"Database connection failed {str(e)}")

        try:
            cursor = conn.cursor()

            query = "SELECT * FROM tv_shows;"

            cursor.execute(query)

            rows = cursor.fetchall() 

            live = [dict(row) for row in rows]
            return live

        except Exception as e: 
            return Response.error(status.HTTP_500_INTERNAL_SERVER_ERROR, f"There was an error getting streams {str(e)}")
        
        finally:
            if conn:
                cursor.close()
                conn.close()
    

    def upload_video(self, stream_id, title, duration, audio):
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

            query = "INSERT INTO tv_show_videos (show_id, title, description, video_url,) VALUES (%s, %s, %s, %s)"

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


