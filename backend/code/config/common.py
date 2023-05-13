from configparser import RawConfigParser


def load_config():
    parser = RawConfigParser()
    parser.read("./config/config.ini")
    return parser['PASSWORDS']
