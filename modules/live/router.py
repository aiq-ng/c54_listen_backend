from fastapi import APIRouter,UploadFile, File, Form, status
from .manage_video_streams import Manage_streams
from modules.shared.response import Response
from .models import videoStreamCategoriesCreate, videoStreamsCreate, tvShowsCreate, tvShowVideosCreate, c54ShortsCreate

stream = Manage_streams()

live = APIRouter(
    prefix ="/live",
    tags = ["live"]
)


@live.get('/')
def test():
    return {"ping": "pong"}


@live.post('/categories')
def create_category( request_data: videoStreamCategoriesCreate):
    video_stream_create = stream.create_video_stream_category(request_data)

    return Response.success(status.HTTP_201_CREATED)

@live.get('/categories')
def get_category():
    stream_cat_data = stream.get_video_stream_category()
    return Response.success(status.HTTP_200_OK, stream_cat_data)



@live.post('/streams')
async def create_video_stream(
                    category_id: int = Form(...),
                    title: str = Form(...),
                    description: str = Form(...),
                    stream_url: str = Form(...),
                    thumbnail: UploadFile = File(...)  # Make thumbnail optional, can be None
                ):
    create_video_stream = stream.create_video_stream(category_id, title, description, thumbnail, stream_url)

    return Response.success(status.HTTP_201_CREATED, create_video_stream)

@live.get('/streams')
def get_streams():
    video_streams = stream.get_video_stream()
    return Response.success(status.HTTP_200_OK, video_streams)


@live.post('/tv/shows/')
async def create_tv_show(
                    title: str = Form(...),
                    description: str = Form(...),
                    thumbnail: UploadFile = File(...)  # Make thumbnail optional, can be None
                ):
    create_video_stream = stream.create_tv_show( title, description, thumbnail)

    return Response.success(status.HTTP_201_CREATED, create_video_stream)

@live.get('/tv/shows/{show_id}')
def get_tv_shows(show_id:int):
    video_streams = stream.get_show_with_videos(show_id)
    return Response.success(status.HTTP_200_OK, video_streams)


@live.get('/tv/shows/')
def get_shows_video():
    tv_shows = stream.get_all_tv_show()
    return Response.success(status.HTTP_200_OK, tv_shows)


@live.post('/streams/audio')
async def upload_audio(
                    stream_id: int = Form(...),
                    title: str = Form(...),
                    duration: int = Form(...),
                    audio: UploadFile = File(...)
                ):
    
    
    add_audio = stream.upload_audio(stream_id, title, duration, audio)
    return {"message": "audio uploaded successfully", "audio": add_audio}


@live.get('/streams/audio/{stream_id}')
def get_audio(stream_id:int):
    stream_audio = stream.get_stream_audio(stream_id)
    return stream_audio




