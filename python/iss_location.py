import requests
import json
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry
from datetime import datetime 

my_url = "http://api.open-notify.org/iss-now.json"
def main():
    session = requests.Session()
    retry = Retry(connect=3, backoff_factor=0.5)
    adapter = HTTPAdapter(max_retries=retry)
    session.mount('http://', adapter)
    session.mount('https://', adapter)
    response = session.get(my_url)
    if response.status_code > 200 :
       print(response)
    else:
       parsed = json.loads(response.text)
       # print(json.dumps(parsed, indent=4, sort_keys=True))
       obj = json.loads(response.text)
       print("At", datetime.fromtimestamp(obj['timestamp'], tz=None))
       print("Longitude", obj['iss_position']['longitude'], "Latitude", obj['iss_position']['latitude'])
       print("https://www.google.co.uk/maps/@" + obj['iss_position']['latitude'] + ","+ obj['iss_position']['longitude'] + ",6z")

main()