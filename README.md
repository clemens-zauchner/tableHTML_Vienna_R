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
# Create temp directory
temp_dir <- tempdir()

#create a temp file for the html
temp_file_location <- tempfile('presentation_r', tmpdir = temp_dir, fileext = '.html')

# create a temp file for the logo
temp_img_dir <- file.path(temp_dir, "img")
dir.create(temp_img_dir)
temp_img_location <- file.path(temp_img_dir, "tableHTML.png")


#download the r presentation and logo
download.file('https://raw.githubusercontent.com/clemens-zauchner/tableHTML_Vienna_R/master/tableHTML_Vienna_R.html',
              temp_file_location)

download.file('https://raw.githubusercontent.com/clemens-zauchner/tableHTML_Vienna_R/master/img/tableHTML.png',
              temp_img_location)


#view it on browser
browseURL(temp_file_location)
```
