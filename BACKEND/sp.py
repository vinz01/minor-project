article = '''
East Repair Inc.

1912 Harvest Lane
New York, NY 12210

Bill To Ship To
Smith John Smith
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
'''

import spacy

#I-Pro B-Pro Name Qty Date Pri Money
def get_details(text):
	spacy_nlp = spacy.load('testnew')
	document = spacy_nlp(text)
	filtered_text=["" for i in range(0,4)]
	filtered_num=[0 for i in range(0,3)]	
	
	print('Original Sentence: %s' % (text))
	txt=""
	for element in document.ents:
	    print('Type: %s, Value: %s' % (element.label_, element))
	    txt+="Type: "+ str(element.label_)+" , "+"Value: " +str(element)
	    if str(element.label_)=="B-PRO":
	    	filtered_text[0]+=str(element)
	    if str(element.label_)=="I-PRO":
	    	filtered_text[1]+=str(element)
	    	filtered_text[1]+=" "
	    if str(element.label_)=="NAME":
	    	filtered_text[2]+=str(element)
	    if str(element.label_)=="DATE":
	    	filtered_text[3]+=str(element)
	    	filtered_text[3]+=" "
	    if str(element.label_)=="PRI":
	    	filtered_num[0]+=float(str(element))
	    try:
		    if str(element.label_)=="MONEY":
		    	if float(str(element))>filtered_num[1]:
		    		filtered_num[1]+=float(str(element))
		
	    except ValueError:
	        print("z")
	    if str(element.label_)=="QTY":
	    	filtered_num[2]+=float(str(element))
	    
	#print(filtered_text)
	#print(filtered_num)
	txt=filtered_text + filtered_num
	#print(txt)
	return txt

#get_details(article)