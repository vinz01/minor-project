import nltk
def extract_entities(text):
	# with open(text, 'r') as file:
	#     text = file.read().replace('\n', '')
	# #print(len(nltk.sent_tokenize(text)))
	# print(text)
	text="""

East Repair Inc.
HP Computer
1912 Harvest Lane
New York, NY 12210
Vinayak Iyer 
Bill To Ship To
John Smith John Smith
2 Court Square 3787 Pineview Drive
New York, NY 12210 Cambridge, MA 12210
ary DESCRIPTION
1 | Front and rear brake cables
2 | New set of pedal arms

3 | Labor 3hrs.

Terms & Conditions
Payment is due within 15 days

Please make checks payable to: East Repair Inc.

INVOICE

Invoice # us-001

Invoice Date 1102/2019

P.o# 2312/2019

Due Date 26/02/2019

UNIT PRICE AMOUNT

100.00 100.00
15.00 30.00
5.00 15.00
Subtotal 145.00
Sales Tax 6.25% 9.08
TOTAL $154.06
 """
	for sent in nltk.sent_tokenize(text):
	 	for chunk in nltk.ne_chunk(nltk.pos_tag(nltk.word_tokenize(sent))):
	 		if hasattr(chunk, 'label'):
	 			print(chunk.label(), ' '.join(c[0] for c in chunk.leaves()))
nltk.download('punkt') 
nltk.download('averaged_perceptron_tagger')
nltk.download('maxent_ne_chunker')
nltk.download('words')
extract_entities("abc.txt")