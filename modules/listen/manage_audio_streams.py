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
        conn = db_connection.get_db_connection()

        if not conn:
            return {"error": "Database connection failed"}

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


        


