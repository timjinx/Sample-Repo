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
    print("Looking for the International Space Station Crew")
    response = session.get(my_url)
    if response.status_code > 200 :
       print(response)
    else:
       parsed = json.loads(response.text)
       print(json.dumps(parsed, indent=4, sort_keys=True))

main()
