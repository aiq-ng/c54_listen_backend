from pydantic import BaseModel
from datetime import datetime
from typing import Any



class listenStreamCreateCategory(BaseModel):
    name: str
    description: str

class listenStreamsCreate(BaseModel):
    category_id: int
    name: str
    description: str

class listenAudioStreamsCreate(BaseModel):
    stream_id: int
    audio: Any
    title: str
    duration: int

class audioStreams(BaseModel):
    data: Any