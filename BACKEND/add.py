import pyap
#import x
from sys import argv

def get_string(text):
    with open(text, 'r') as file:
        data = file.read().replace('\n', '')
    addresses = pyap.parse(data, country='US')
    print(addresses)

    return addresses

#x.test()
# if len(argv)<2:
#     print("Usage: python image-to-text.py relative-filepath")
# else:
#     print('--- Start recognize text from image ---')
#     for i in range(1,len(argv)):
#         print(argv[i])
#         get_string(argv[i])
        

#     print('------ Done -------')

