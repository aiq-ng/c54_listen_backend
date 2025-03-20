from fastapi import APIRouter,UploadFile, File, Form
from .manage_audio_streams import Manage_streams
from .models import listenStreamCreateCategory, listenAudioStreamsCreate, listenStreamsCreate, audioStreams


stream = Manage_streams()

listen = APIRouter(
    prefix ="/listen",
    tags = ["listen"]
)


@listen.get('/')
def test():
    return {"ping": "pong"}


@listen.post('/streams')
async def add_stream(
                    category_id: int = Form(...),
                    name: str = Form(...),
                    description: str = Form(...),
                    stream_url: str = Form(...),
                    thumbnail: UploadFile = File(None)  # Make thumbnail optional, can be None
                ):
    create_stream = stream.create_stream(category_id, name, description, thumbnail, stream_url)

    return {"message": "created stream successfully"}

@listen.get('/streams')
def get_streams():
    streams = stream.get_stream()
    return streams

@listen.post('/streams/audio')
async def upload_audio(
                    stream_id: int = Form(...),
                    title: str = Form(...),
                    duration: int = Form(...),
                    audio: UploadFile = File(...)
                ):
    
    
    add_audio = stream.upload_audio(stream_id, title, duration, audio)
    return {"message": "audio uploaded successfully", "audio": add_audio}


@listen.get('/streams/audio/{stream_id}')
def get_audio(stream_id:int):
    stream_audio = stream.get_stream_audio(stream_id)
    return stream_audio


@listen.get('/streams/category')
def get_category():
    stream_cat_data = stream.get_stream_category()
    return stream_cat_data


@listen.post('/streams/category')
def create_category( request_data: listenStreamCreateCategory):
    stream_create = stream.create_stream_category(request_data)

    if stream_create:
        return {"message": "category created successfully "}


@listen.get('/streams/new_episodes')
def get_new_episodes():
    new_episodes = stream.get_new_episodes()

    return new_episodes