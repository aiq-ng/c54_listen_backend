import cloudinary
import cloudinary.uploader
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()


try:
    cloudinary.config(
        cloud_name=os.getenv('cloud_name'),
        api_key=os.getenv('api_key'),
        api_secret=os.getenv('api_secret')
    )
except Exception as e:
    print("Error during configuration:", str(e))


class ManageAudio:
    def __init__(self):  # Fixed: Added parentheses
        pass

    @staticmethod
    def uploadBasic(audio_file):
        response = cloudinary.uploader.upload(audio_file, resource_type="video", folder="c54_audio_streams",)
        return response

    @staticmethod
    def uploadLarge(audio_file):
        response = cloudinary.uploader.upload(
            audio_file,
            resource_type="video",
            folder="c54_audio_streams",
            chunk_size=6000000
        )
        return response


class ManageImageUpload():


    @staticmethod
    def upload_image(image_file, folder="podcast_images"):

        try:
            # Upload the image to Cloudinary
            response = cloudinary.uploader.upload(
                image_file,
                resource_type="image",  # Specify image type
                folder="c54_images",          # Organize in a folder
                use_filename=True,      # Use original filename
                unique_filename=False   # Avoid appending random strings to filename
            )
            return response
        except cloudinary.exceptions.Error as e:
            raise Exception(f"Cloudinary upload failed: {str(e)}")
        except Exception as e:
            raise Exception(f"Unexpected error: {str(e)}")