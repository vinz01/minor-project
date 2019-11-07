# invoice-processing
NER Model along with Tesseract OCR to extract data and classify it

Running instructions:

Keep add.py, ocr.py, name.py, sp.py, fire.py, test.png in the same directory

Download "testnew" folder in the same dir

run fire.py

NER Model files: 
(not required for final execution)
custom3.py
custom.py
conv.py
convsp.py
ner_dataset.csv
ner_dataset.tsv
ner_dataset.json
ner_dataset.spacy

testnew folder contains the trained custom NER Model

Pre req modules: firebase, pytesseract, nltk (if name.py), spacy ,Flask,firebase_admin


References:
https://medium.com/@godbole.abhay/hi-kaustumbh-3bdd483eeed2
https://timkuhn.github.io/TextMining/spacy/ner/2018/01/24/spaCy_NER_Training.html
https://github.com/explosion/spaCy/issues/4095
https://github.com/kaustumbh7/NLP/tree/master/Named%20Entity%20Recognition/Data main
https://github.com/explosion/spaCy/issues/3558 invoice
https://medium.com/p/7140ebbb3718/responses/show
https://towardsdatascience.com/custom-named-entity-recognition-using-spacy-7140ebbb3718 main
https://medium.com/@manivannan_data/how-to-train-ner-with-custom-training-data-using-spacy-188e0e508c6
https://app.nanonets.com/#/models
https://medium.com/explore-artificial-intelligence/introduction-to-named-entity-recognition-eda8c97c2db1
https://www.kaggle.com/questions-and-answers/29103
https://liu.diva-portal.org/smash/get/diva2:1215460/FULLTEXT01.pdf related paper
