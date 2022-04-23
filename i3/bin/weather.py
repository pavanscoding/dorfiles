#!/usr/bin/env python3
import requests
import os
# changing a bit of this https://www.geeksforgeeks.org/python-find-current-weather-of-any-city-using-openweathermap-api/
api_key = "AAAAPPPPIIII_____KKKKEEEEYYYY"  # Enter the API key you got from the OpenWeatherMap website
base_url = "http://api.openweathermap.org/data/2.5/weather?"

city_name = "Mountain House" #change city name based on your city
complete_url = base_url + "appid=" + 'd850f7f52bf19300a9eb4b0aa6b80f0d' + "&q=" + city_name  # This is to complete the base_url, you can also do this manually to checkout other weather data available
response = requests.get(complete_url)
x = response.json()

if x["cod"] != "404":
    y = x["main"]

    current_temperature = y["temp"]
    z = x["weather"]

    weather_description = z[0]["description"].lower()

    # print(" Temperature (in kelvin unit) = " +
    #                 str(current_temperature) +
    #       "\n description = " +
    #                 str(weather_description))
    icon=""
    if('thunderstorm' in weather_description):
        icon="  "
    elif('drizzle' in weather_description or 'rain' in weather_description):
        icon="  "
    elif('snow' in weather_description):
        icon="  "
    elif('clear' in weather_description):
        icon="  "
    elif('cloud' in weather_description):
        icon="  "
    elif('ash' in weather_description or 'dust' in weather_description or 'smoke' in weather_description or 'sand' in weather_description or 'squal' in weather_description):
        icon="  "
    elif('tornado' in weather_description):
        icon="  "
    else:
        icon="  "
    os.system('echo '+icon+str(int((current_temperature-273)*1.8+32))+"°F")
    os.system('echo '+icon+str(int((current_temperature-273)*1.8+32))+"°F")
    if("" in icon or "" in icon):
        os.system('echo "#EE4B2B"')
    if("" in icon):
        os.system('echo #00FFFF')
    if("" in icon):
        os.system('echo #FFBF00')
    if("" in icon):
        os.system('echo #CCCCFF')
else:
    print(" City Not Found ")
