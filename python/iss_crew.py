import json
import requests
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry
my_url = "http://api.open-notify.org/astros.json"
def main():
    session = requests.Session()
    retry = Retry(connect=3, backoff_factor=0.5)
    adapter = HTTPAdapter(max_retries=retry)
    session.mount('http://', adapter)
    session.mount('https://', adapter)
    response = session.get(my_url)
    if response.status_code > 200 :
        print(response)
        exit(-1)
    
    parsed = json.loads(response.text)
    for key in parsed:
        if key == "number":
            print("There are", parsed[key], "people in space right now")
        if key == "people":
            for person in parsed[key]:
                astroname = ""
                craft = ""
                for n, v in person.items():
                    if n == "name":
                        astroname = v
                    if n == "craft":
                        craft = v
                if astroname and craft:
                    print(astroname, "is on board the", craft)


main()
