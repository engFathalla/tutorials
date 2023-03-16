import uuid
import logging
from time import sleep
from log import JsonFormatter


def run():
    while True:
        logging.info(f'request id {uuid.uuid4()}')
        sleep(1)


def setupLogger():
    logger = logging.getLogger()
    logger.setLevel(logging.INFO)

    json_formatter = JsonFormatter(
        {"level": "levelname", "message": "message", "loggerName": "name",
         "processName": "processName", "processID": "process", "threadName": "threadName",
         "threadID": "thread", "timestamp": "asctime"})

    stream_handler = logging.StreamHandler()
    stream_handler.setFormatter(json_formatter)
    logger.addHandler(stream_handler)


if __name__ == '__main__':
    setupLogger()
    run()
