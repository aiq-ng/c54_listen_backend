In FastAPI, the `status` module (`from fastapi import status`) provides a comprehensive list of HTTP status code constants that you can use in your endpoints. These constants follow the naming convention `HTTP_<code>_<description>` (e.g., `HTTP_200_OK`) and align with standard HTTP status codes defined by the IETF (RFC 7231 and others). Below is a complete list of all status codes available in FastAPI’s `status` class as of the latest version, grouped by category (1xx, 2xx, 3xx, 4xx, 5xx).

### 1xx - Informational Responses
These indicate provisional responses or processing states.

- **`HTTP_100_CONTINUE`** = 100
- **`HTTP_101_SWITCHING_PROTOCOLS`** = 101
- **`HTTP_102_PROCESSING`** = 102
- **`HTTP_103_EARLY_HINTS`** = 103

### 2xx - Successful Responses
These indicate that the request was successfully received, understood, and accepted.

- **`HTTP_200_OK`** = 200
- **`HTTP_201_CREATED`** = 201
- **`HTTP_202_ACCEPTED`** = 202
- **`HTTP_203_NON_AUTHORITATIVE_INFORMATION`** = 203
- **`HTTP_204_NO_CONTENT`** = 204
- **`HTTP_205_RESET_CONTENT`** = 205
- **`HTTP_206_PARTIAL_CONTENT`** = 206
- **`HTTP_207_MULTI_STATUS`** = 207
- **`HTTP_208_ALREADY_REPORTED`** = 208
- **`HTTP_226_IM_USED`** = 226

### 3xx - Redirection Messages
These indicate that further action is needed to complete the request, often involving redirection.

- **`HTTP_300_MULTIPLE_CHOICES`** = 300
- **`HTTP_301_MOVED_PERMANENTLY`** = 301
- **`HTTP_302_FOUND`** = 302
- **`HTTP_303_SEE_OTHER`** = 303
- **`HTTP_304_NOT_MODIFIED`** = 304
- **`HTTP_305_USE_PROXY`** = 305
- **`HTTP_306_RESERVED`** = 306 (Deprecated, but included)
- **`HTTP_307_TEMPORARY_REDIRECT`** = 307
- **`HTTP_308_PERMANENT_REDIRECT`** = 308

### 4xx - Client Error Responses
These indicate that the request contains bad syntax or cannot be fulfilled due to client-side issues.

- **`HTTP_400_BAD_REQUEST`** = 400
- **`HTTP_401_UNAUTHORIZED`** = 401
- **`HTTP_402_PAYMENT_REQUIRED`** = 402
- **`HTTP_403_FORBIDDEN`** = 403
- **`HTTP_404_NOT_FOUND`** = 404
- **`HTTP_405_METHOD_NOT_ALLOWED`** = 405
- **`HTTP_406_NOT_ACCEPTABLE`** = 406
- **`HTTP_407_PROXY_AUTHENTICATION_REQUIRED`** = 407
- **`HTTP_408_REQUEST_TIMEOUT`** = 408
- **`HTTP_409_CONFLICT`** = 409
- **`HTTP_410_GONE`** = 410
- **`HTTP_411_LENGTH_REQUIRED`** = 411
- **`HTTP_412_PRECONDITION_FAILED`** = 412
- **`HTTP_413_REQUEST_ENTITY_TOO_LARGE`** = 413 (Also aliased as `HTTP_413_PAYLOAD_TOO_LARGE`)
- **`HTTP_414_REQUEST_URI_TOO_LONG`** = 414 (Also aliased as `HTTP_414_URI_TOO_LONG`)
- **`HTTP_415_UNSUPPORTED_MEDIA_TYPE`** = 415
- **`HTTP_416_REQUESTED_RANGE_NOT_SATISFIABLE`** = 416
- **`HTTP_417_EXPECTATION_FAILED`** = 417
- **`HTTP_418_IM_A_TEAPOT`** = 418 (Easter egg from RFC 2324)
- **`HTTP_421_MISDIRECTED_REQUEST`** = 421
- **`HTTP_422_UNPROCESSABLE_ENTITY`** = 422
- **`HTTP_423_LOCKED`** = 423
- **`HTTP_424_FAILED_DEPENDENCY`** = 424
- **`HTTP_425_TOO_EARLY`** = 425
- **`HTTP_426_UPGRADE_REQUIRED`** = 426
- **`HTTP_428_PRECONDITION_REQUIRED`** = 428
- **`HTTP_429_TOO_MANY_REQUESTS`** = 429
- **`HTTP_431_REQUEST_HEADER_FIELDS_TOO_LARGE`** = 431
- **`HTTP_451_UNAVAILABLE_FOR_LEGAL_REASONS`** = 451

### 5xx - Server Error Responses
These indicate that the server failed to fulfill a valid request due to an internal issue.

- **`HTTP_500_INTERNAL_SERVER_ERROR`** = 500
- **`HTTP_501_NOT_IMPLEMENTED`** = 501
- **`HTTP_502_BAD_GATEWAY`** = 502
- **`HTTP_503_SERVICE_UNAVAILABLE`** = 503
- **`HTTP_504_GATEWAY_TIMEOUT`** = 504
- **`HTTP_505_HTTP_VERSION_NOT_SUPPORTED`** = 505
- **`HTTP_506_VARIANT_ALSO_NEGOTIATES`** = 506
- **`HTTP_507_INSUFFICIENT_STORAGE`** = 507
- **`HTTP_508_LOOP_DETECTED`** = 508
- **`HTTP_510_NOT_EXTENDED`** = 510
- **`HTTP_511_NETWORK_AUTHENTICATION_REQUIRED`** = 511

### Notes
- **Aliases**: Some codes have aliases for clarity (e.g., `HTTP_413_REQUEST_ENTITY_TOO_LARGE` is also `HTTP_413_PAYLOAD_TOO_LARGE`), but they map to the same numeric value.
- **Source**: These are derived from FastAPI’s dependency on Starlette, which defines them in `starlette.status`. The list is exhaustive as of FastAPI version 0.112.0 (March 2025).
- **Usage**: Import with `from fastapi import status` and use like `status.HTTP_200_OK`.

### How to Verify the List Yourself
You can print all available status codes in your FastAPI app:

```python
from fastapi import FastAPI, status
import inspect

app = FastAPI()

@app.get("/status-codes")
async def list_status_codes():
    # Get all attributes from status module that start with "HTTP_"
    status_codes = {
        name: value for name, value in inspect.getmembers(status)
        if name.startswith("HTTP_") and isinstance(value, int)
    }
    return status_codes

# Run with: uvicorn main:app --reload
# Visit: http://127.0.0.1:8000/status-codes
```

This will return a JSON object with all status codes and their values (e.g., `{"HTTP_200_OK": 200, ...}`).

### Common Examples in Your Context
For your C54 news platform:
- **`HTTP_201_CREATED`**: After uploading a video to `tv_show_videos` or `c54_shorts`.
- **`HTTP_200_OK`**: When retrieving the latest streams from `video_streams`.
- **`HTTP_400_BAD_REQUEST`**: If an invalid file type is uploaded.
- **`HTTP_404_NOT_FOUND`**: If a `stream_id` doesn’t exist.
- **`HTTP_500_INTERNAL_SERVER_ERROR`**: For Cloudinary or database failures.

Let me know if you want examples using specific status codes in your endpoints!