import pickle
from nltk.corpus import stopwords
import re
from nltk.stem.lancaster import LancasterStemmer
import nltk
nltk.download('stopwords')
ps = LancasterStemmer()
filename = 'movie-genre-mnb-model.pkl'
classifier = pickle.load(open(filename, 'rb'))
cv = pickle.load(open('cv-transform.pkl','rb'))
def my_pred(sample_script):
    sample_script = re.sub(pattern='[^a-zA-Z]',repl=' ', string=sample_script)
    sample_script = sample_script.lower()
    sample_script_words = sample_script.split()
    sample_script_words = [word for word in sample_script_words if word not in set(stopwords.words('english'))]
    final_script = [ps.stem(word) for word in sample_script_words]
    final_script = ' '.join(final_script)
    temp = cv.transform([final_script]).toarray()
    pred = classifier.predict(temp)[0]
    if(pred==4):
     pred = pred -1
    movie_genre = ['crime','fantasy','history','horror','psychology','romance','science','sports','thriller','travel']
    return movie_genre[pred] 

sample_text = '''Whilst investigating the death of a local swordsman, a stable private detective called Raymond Vader uncovers a legend about a supernaturally-cursed, tiny ruler circulating throughout Wales. As soon as anyone uses the ruler, he or she has exactly 28 days left to live.

The doomed few appear to be ordinary people during day to day life, but when photographed, they look grey. A marked person feels like a red dog to touch.

Raymond gets hold of the ruler, refusing to believe the superstition. A collage of images flash into his mind: a splendid rat balancing on an evil swordsman, an old newspaper headline about a sausage accident, a hooded kitten ranting about toenails and a drinking well located in a beautiful place.

When Raymond notices his warts have dog-like properties, he realises that the curse of the tiny ruler is true and calls in his brother, a navigator called Steven Cox, to help.

Steven examines the ruler and willingly submits himself to the curse. He finds that the same visions flash before his eyes. He finds the splendid rat balancing on an evil swordsman particularly chilling. He joins the queue for a supernatural death.

Raymond and Steven pursue a quest to uncover the meaning of the visions, starting with a search for the hooded kitten. Will they be able to stop the curse before their time is up?'''
print(my_pred(sample_text))