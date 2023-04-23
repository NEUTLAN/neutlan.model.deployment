import requests

url = "http://0.0.0.0:8000/paraphrase"
payload = {"text": "Original text goes here."}
response = requests.post(url, json=payload)

if response.status_code == 200:
    print(response.json())
else:
    print("Failed to paraphrase text. Status code:", response.status_code)