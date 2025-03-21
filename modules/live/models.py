from pydantic import BaseModel
from datetime import datetime
from typing import Any


class videoStreamCategoriesCreate(BaseModel):
    name: str
    description: str

class videoStreamsCreate(BaseModel):
    category_id: int
    title: str
    description: str
    thumbnail_url: str 
    stream_url: str

class tvShowsCreate(BaseModel):
    stream_id: int
    audio: Any
    title: str
    duration: int

class tvShowVideosCreate(BaseModel):
    stream_id: int
    audio: Any
    title: str
    duration: int


class c54ShortsCreate(BaseModel):
    data: Any