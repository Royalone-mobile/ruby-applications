# KSolves-Tweet

> KSolves-Tweet is a tweet sharing ROR App which tweets the image of city with Good Morning text at 8:00 am

### Description
Tweet is a tweet sharing ROR App. The input is a CSV file with list of cities. When it's 8am in any timezone, a random city is picked from that CSV file. A tweet string starting with "Good morning, CITYNAME" is created. Google map API is called so as to get the Google maps URL for that city. The URL is then passed through google URL shortener API. Google images API is used to get an image for that city with search query "City Country beautiful". Hence the final tweet string will be "Good morning, CITYNAME the Google Map URL and the PHOTO_URL"(where the photo is attached to the tweet as media). The tweet is shared, wait for the next timezone to hit 8am.  

It is developed in September 2014 by [Koduc](http://koduc.com/) team with the help of valuable contributors.

### Working URL
KSolves_Stripe : [http://ksolves-tweet.herokuapp.com/](http://ksolves-tweet.herokuapp.com/)

### Configuration required
* Declare TWITTER_APP_ID and TWITTER_SECRET in the constant.rb file. 

### Technical Description
* We have declared following gems in the Gemfile:

```ruby
gem 'oauth' 
gem 'twitter'
gem 'rest_client'
gem 'authlogic'
gem 'omniauth-twitter'
```
* For "Sign in with Twitter" we have used omniauth-twitter gem.
* In the config folder require the twitter credentials in omniauth.rb file in the format given below:

```ruby
require "constants"
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_APP_ID, TWITTER_SECRET
end
```
* Now a random city is picked from the CSV file already present in the public folder:

```ruby
file_name="#{Rails.root}/public/cities-timezone-csv.csv"
```
* We have required the Map URL of the city and the image URL of the city using the Google APIs. First form the search string and then pass that search string using Google APIs.

```ruby
search_string="#{name} country beautiful".gsub(" ","%20")
url="http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{search_string}"
```
* If the post is successfully posted the user will receive success message. 

#### Steps to be followed for Tweet Demo:
* Click on "Sign in with Twitter".

* Enter your twitter credentials.

* Authorize the application.

* Details of the User twitter account will be displayed after the successful authorization.

* Click on "Click here to tweet" to publish your tweet. 

* Image of the random city selected from the CSV file with the "Good morning, CITYNAME" message will be posted on the twitter account of the User. 

* You can also click on the Sign Out link before posting the tweet on twitter account.

## Queries and Issues 

Your valuable queries and suggestions are welcomed. Please report the issues on GitHub at https://github.com/kartiksolves/KSolves-Tweet

## Contact 

If you have any query, need support or advice just DROP us a line and we’ll be in touch very soon.

Email: support@koduc.com

You can also contact us at +91-120-4540178

We’d love to hear from you! :) :)

