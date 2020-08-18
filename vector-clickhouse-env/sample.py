import json
import requests

number_of_http_200 = 30
number_of_http_500 = 13
number_of_http_404 = 6

nginx_base_url = 'http://localhost:80'

for i in range(number_of_http_200):
   r = requests.get(nginx_base_url)
   print(r.status_code, r.json())

for i in range(number_of_http_404):
   r = requests.post(nginx_base_url)
   print( r.status_code )

for i in range(number_of_http_500):
   r = requests.get(nginx_base_url+"/lua-test")
   print(r.status_code)