# tableHTML_Vienna_R

This repo contains the slides for the introduction to tableHTML at the [Vienna<-R meetup](https://www.meetup.com/ViennaR/events/254963320/), 9 October 2018.

## Contents 

- What are HTML tables?
- What is tableHTML?
- Basic syntax & features of tableHTML
- add_css_\*() family of functions
- Conditional formatting
- Themes
- confution matrix

## Download and view the presentation

You can download and view the presentation in your browser by using the code below:

```
#create a temp file
temp_file_location <- tempfile('presentation_r', fileext = '.html')

#download the r presentation
download.file('https://raw.githubusercontent.com/clemens-zauchner/tableHTML_Vienna_R/master/tableHTML_Vienna_R.html',
              temp_file_location)

#view it on browser
browseURL(temp_file_location)
```
