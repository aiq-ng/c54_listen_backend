import os
import sys

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from modules.listen.router import listen as listen_router
from modules.live.router import live as live_router

app = FastAPI()



origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Routes
app.include_router(listen_router)
app.include_router(live_router)


