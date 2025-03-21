from fastapi import APIRouter,UploadFile, File, Form, status
from .manage_audio_streams import Manage_streams
from .models import listenStreamCreateCategory, listenAudioStreamsCreate, listenStreamsCreate, audioStreams
from modules.shared.response import Response


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

    return Response.success(status.HTTP_200_OK, [])

@listen.get('/streams')
def get_streams():
    streams = stream.get_stream()
    return Response.success(status.HTTP_200_OK, streams)

@listen.post('/streams/audio')
async def upload_audio(
                    stream_id: int = Form(...),
                    title: str = Form(...),
                    duration: int = Form(...),
                    audio: UploadFile = File(...)
                ):
    
    
    add_audio = stream.upload_audio(stream_id, title, duration, audio)
    return Response.success(status.HTTP_200_OK, [])



@listen.get('/streams/categories')
def get_category():
    stream_cat_data = stream.get_stream_category()
    return Response.success(status.HTTP_200_OK, stream_cat_data)


@listen.post('/streams/categories')
def create_category( request_data: listenStreamCreateCategory):
    stream_create = stream.create_stream_category(request_data)

    return Response.success(status.HTTP_200_OK, [])


@listen.get('/streams/new_episodes')
def get_new_episodes():
    new_episodes = stream.get_new_episodes()

    return Response.success(status.HTTP_200_OK, new_episodes)


@listen.get('/streams/all/categories')
def get_categorise_streams():
    categorise_streams = stream.get_all_categories_with_streams()

    return Response.success(status.HTTP_200_OK, categorise_streams)


@listen.get('/streams/audio/{stream_id}')
def get_categorise_streams(stream_id:int):
    categorise_streams = stream.get_stream_with_audio(stream_id)

    return Response.success(status.HTTP_200_OK, categorise_streams)


@listen.get('/streams/popular')
def get_categorise_streams():
    popular_streams = stream.get_popular_podcasts()

    return Response.success(status.HTTP_200_OK, popular_streams)

