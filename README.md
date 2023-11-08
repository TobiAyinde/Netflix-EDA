# Netflix-EDA

# Data Description of Netflix Dataset

![image](https://github.com/TobiAyinde/Netflix-EDA/assets/149031697/5dd3a861-05b7-4722-b954-fe94ac0dfd97)


The above image shows that the data is made up of 8807 observations and 12 variables, which are 

Show_id: identification number       

Type: Whether the show is a Movie or TV show

Title: Name of the show

Director: The director of the show

Cast: The actors and actresses that were cast in the show

Country: Origin of the show

Date_added: The day the show was added to the Netflix streaming platform	

Release_year: The day the show was released to the public

Rating: Age rating of the show

Duration: Time duration of the show

Listed_in	: The genre of the show

Description: A synopsis of the show


# Checking for Missing Data

> apply(netflix, MARGIN = 2, FUN = function(x) sum(is.na(x)))

     show_id         type        title     director         cast      country   date_added release_year 
           0            0            0            0            0            0            0            0

      rating     duration    listed_in  description 
           0            0            0            0


There are no missing data in the dataset.

# Missing Map

![image](https://github.com/TobiAyinde/Netflix-EDA/assets/149031697/59458651-70e1-4628-9822-a6f1c7797e60)

# Count of Movies and TV Shows



# Bar Plot for Type of Shows

![image](https://github.com/TobiAyinde/Netflix-EDA/assets/149031697/1b4316ed-7552-4ddd-94db-455d5c724bb8) ![newplot](https://github.com/TobiAyinde/Netflix-EDA/assets/149031697/d08c4879-7f5a-4154-9907-306dc92aa62f)


+   summarise(count = n ())
  
# A tibble: 2 × 2

  Type    Count
  
  <fct>   <int>
  
1 Movie    6131

2 TV Show  2676

The table above shows that there are more Movies than TV shows


# Movie Distribution

![image](https://github.com/TobiAyinde/Netflix-EDA/assets/149031697/4c6af479-68a4-4224-a79a-84700dfe3747) ![image](https://github.com/TobiAyinde/Netflix-EDA/assets/149031697/02d48173-9591-4424-8792-b76b03eedf55)



# Bar Chart of Movies Vs. Countries

![image](https://github.com/TobiAyinde/Netflix-EDA/assets/149031697/0c9bb64c-76fd-4e85-a986-d6c5524a5826)




# Bar Chart of Genres Vs. Titles

![image](https://github.com/TobiAyinde/Netflix-EDA/assets/149031697/6b0b1df2-5046-4679-b714-adb86876ac1f)





