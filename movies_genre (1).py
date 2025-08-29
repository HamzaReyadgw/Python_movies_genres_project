#!/usr/bin/env python
# coding: utf-8

# Getting the data and importing libraries

# In[1]:


import pandas as pd
import numpy as np 
import matplotlib.pyplot as plt
import seaborn as sns


# In[2]:


movies_data = pd.read_csv(r"C:\\Users\\LORD\\OneDrive\\Desktop\\python files\\imdb_movies.csv")
pd.set_option('display.max.columns', 21)
movies_data.head(2)


# In[3]:


movies_filtered = movies_data.drop(columns = ['cast','overview','homepage','tagline','keywords'])
movies_filtered.info()


# In[5]:


movies = movies_filtered.drop_duplicates(subset = ['id'])


# In[6]:


movies.head(2)


# In[7]:


from pandas import Series,DataFrame
split = movies['genres'].str.split('|').apply(Series,1).stack()
split.index = split.index.droplevel(-1)
split.name = 'genres_split'


# In[8]:


del movies['genres']
movies = movies.join(split)


# In[9]:


movies.head()


# Which genres are the most common?

# In[10]:


df=pd.DataFrame(movies.groupby('genres_split')['original_title'].nunique()).sort_values(by = 'original_title',ascending = False)


# In[12]:


plt.figure(figsize = (20,10))
df['original_title'].plot.pie(autopct = '%1.1f%%')


# The answer is drama movies are the most common genre

# In[19]:


plt.figure(figsize = (20,10))
df['original_title'].plot.barh()


# Which genres have high avg budget and revenue?

# In[40]:


movies.head(4)


# In[20]:


movies['profit'] = movies['revenue'] - movies['budget']
pd.options.display.float_format = '{:2f}'.format
averages = movies.groupby('genres_split').mean()
averages.sort_values(by = 'revenue',ascending = True ,inplace = True)


# In[21]:


plt.figure(figsize = (20,10))
averages[['budget','revenue']].plot.barh(color = ('darkblue' , 'c'))


# In[47]:


averages.sort_values(by = 'profit',ascending = True ,inplace = True)
averages['profit'].plot.barh(color = 'darkblue',title = 'Profit per genre')


# In[ ]:





# Which genres have high avg popularity?

# In[27]:


averages


# In[ ]:


0.6578598628414406


# In[36]:


avg_popularity =  averages['popularity'].mean()
high_avg_popularity = averages[averages['popularity'] > avg_popularity]
high_avg_popularity_sorted = high_avg_popularity.sort_values(by = 'popularity' , ascending = False)


# In[46]:


high_avg_popularity_sorted['popularity'].plot.barh(color = 'c',figsize = (10 , 8),title = 'Popularity per genre')


# In[ ]:





# Which genres have the highest number of movies with an voting average >= 8

# In[70]:


vote_high_avg = movies[movies['vote_average'] > 8 ]
vote_high_avg


# In[71]:


high_avg_vote2 = pd.DataFrame(vote_high_avg.groupby('genres_split')['vote_average'].nunique()).sort_values(by = 'vote_average',ascending = True )


# In[72]:


high_avg_vote2.plot.barh(color = 'darkblue',figsize = (10 , 8),title = 'Genres with high avg vote')


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




