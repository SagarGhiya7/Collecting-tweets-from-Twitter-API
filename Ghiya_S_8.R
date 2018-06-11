# Sets up the working directory for collecting twitter data

setwd("C:/Users/Sagar Ghiya/Desktop")
# Loading required packages
library(RCurl)
library(ROAuth)
library(streamR)
library(twitteR)

# Downloading and creating certification file on desktop

download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
# File to collect twitter json data
outFile <- "tweets_sample.json"

# Setting up configuration details
requestURL       <- "https://api.twitter.com/oauth/request_token"
accessURL        <- "https://api.twitter.com/oauth/access_token"
authURL          <- "https://api.twitter.com/oauth/authorize"
consumerKey      <- "DAtp8jsPCkdbf2JLy0RXOExWC"                                                                                   
consumerSecret   <- "zUp1Odp2hYFTmBXn7XgfjjXWiuiB4RcaCZv2NV7XozQGzzwjfp"                                                                                   
accessToken      <- "321286987-OqcrTDbJZ8AevmC2gkq9T4MKQYBYxo5IIR5Pcpit"
accessTokenSecret<- "F4Bjs7kPC5lgdknJ0VmVwPxcI72we8tFFxz1FKUZE09Xt"


# Authenticating via OAUth handshake
my_oauth <- OAuthFactory$new( consumerKey=consumerKey,
                              consumerSecret=consumerSecret,
                              requestURL=requestURL,
                              accessURL=accessURL, 
                              authURL=authURL)
my_oauth$handshake(cainfo="cacert.pem")


# Setting up Oauth credentials
setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessTokenSecret)

# Getting tweet data
sampleStream( file=outFile, oauth=my_oauth, tweets=100 )

# Getting tweet data based on criteria such as track and location
follow   <- ""  
track    <- "Boston,RedSoxs"  
location <- c(23.786699, 60.878590, 37.097000, 77.840813)  
filterStream( file.name=outFile, follow=follow, track=track, 	locations=location, oauth=my_oauth, timeout=5)

