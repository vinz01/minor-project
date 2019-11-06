import firebase_admin
from firebase_admin import credentials
from firebase_admin import storage
from firebase_admin import credentials
import datetime
import webbrowser
import urllib.request
import ocr
import add
import sp
from flask import Flask,jsonify,request

app = Flask(__name__)
urls =[
    {
        'url' : ''
    }
]
@app.route('/',methods=['POST'])
def manage_invoice():
    request_data = request.get_json()
    urls=[
        {
            'url' : request_data['url']
        }
    ]

    print(urls[0]['url'])

    blob = bucket.blob(urls[0]['url'])

    x=(blob.generate_signed_url(datetime.timedelta(seconds=1000), method='GET'))

    #webbrowser.open(x)

    urllib.request.urlretrieve(x, "firebasetest.jpg")

    filename=ocr.image_to_text("test.png")

    address=add.get_string(filename) #params: filename

    string=ocr.send_string("test.png")

    details=sp.get_details(string)
    return jsonify(details)



cred = credentials.Certificate("credentials.json")
    #firebase_admin.initialize_app(cred)

    # Fetch the service account key JSON file contents
    #cred = credentials.Certificate("credentials.json")

    # Initialize the app with a service account, granting admin privileges
appMain = firebase_admin.initialize_app(cred, {
        'storageBucket': 'assets-bills.appspot.com',
    }, name='storage')

bucket = storage.bucket(app=appMain)

app.debug = True
app.run(port=5203)