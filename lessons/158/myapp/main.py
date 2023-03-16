import uuid
import logging
from time import sleep


def run():
    while True:
        logging.info(f'request id {uuid.uuid4()}')
        sleep(1)


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    run()
