

class Response():

    @staticmethod
    def success(status_code, data=[]):
        response = {"status_code": status_code, "data": data }

        return response

    @staticmethod
    def error(status_code, message):
        response = {"status_code": status_code, "message": message }

        return response