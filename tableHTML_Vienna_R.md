# Introduction to tableHTML
Theo Boutaris, Clemens Zauchner  
09 October 2018  
[//]: # (
http://www.w3schools.com/css/css_font.asp
http://www.cssfontstack.com/Helvetica
)

<style>
/* gdbar size (that contains logo) on title page */
/* needs to have greater height than logo image, other stuff is irrelevant */
.gdbar {
  position:absolute !important;
  top: 50px !important; left: auto; right: 0px !important; width: 0px !important;
  height: 500px !important;  /* modify if logo is larger than this in height */
}

/* logo size on title page */
.gdbar img {
  position: absolute; 
  top: 0px;
  left: 50px;
  width: 500px !important;
  height: 220px !important;
}
/*77 64*/
/* logo size on slides */
slides > slide:not(.nobackground):before {
  width: 200px; height: 88px; /* modify width and height (twice) */
  background-size: 200px 88px;
  position: absolute; left: auto;
  right: -30px;  /* modify position */
  top: 10px;
}

/* for slides with red background (only works for normal text, not whole slide) {.bgred} */
.bgred,
.bgred div,
.bgred body,
.bgred .article,
.bgred article,
.bgred .prettyprint,
.bgred .h1,
.bgred .h2,
.bgred .h3,
.bgred backdrop,
.bgred .backdrop,
.bgred .slide,
.bgred slide,
.bgred slides > slide.backdrop {   
  background-color:#ffaaaa;
  background:#ffaaaa;
}

.footer {
    position: fixed;
    top: 70%;
    width:100%;
}

/*slides > slide.backdrop {   */
/*  background-color:#ffaaaa;   */
/*  background:#ffaaaa;   */
/*}   */
</style>



## Contents

- Introduction to the authors
- Motivation: Why develop the package?
- What are HTML tables?
- What is tableHTML?
- Basic syntax & features of tableHTML
- add_css_*() family of functions
- Conditional formatting
- Themes
- confution matrix

## Introduction to the authors

### Theo Boutaris

Theo is a Data Scientist currently residing in the UK. He has a passion for statistics and coding, which naturally led him to follow the Data Science path. He is an R evangelist and open source supporter and tries to give back to the community in his free time. He originates from the great city of Thessaloniki in Greece. When not coding, he plays football, listens to music or plays Dota2.


### Clemens Zauchner

Studied business informatics in Innsbruck and data science in London. Worked with companies like OMV, easyJet, and Sainsbury’s. Currently Data Scientist @ The Unbelievable Machine Company. Co-author of open source R package tableHTML, a tool to create and style HTML tables from R.

## Motivation: Why develop the package?

- Development started in 2016
- While developing a [football app](https://lyzander.shinyapps.io/FootballeR/) using shiny, it was somewhat difficult to build a pretty HTML table
- Example: drawing vertival lines every three columns seemd like a difficult task
- even using great packages like `xtable`


## What is tableHTML?

- A package for building CSS-ible HTML tables in an easy and intuitive way
- Compatible with any application that accepts HTML (e.g. shiny, rmarkdown, Outlook, PowerPoint, Word)
- The main function tableHTML converts a data.frame or matrix or any other object that can be converted into a data.frame into an HTML table
- Using the function on R Studio will print the table on the viewer otherwise it will use the default browser
- The default tables are built without any CSS in order to allow for full flexibility although two themes are included
- Re-exports the pipe `%>%` operator

## What are HTML tables?


```html
<table style="width:100%">
  <thead>
    <tr>
      <th>Firstname</th>
      <th>Lastname</th>
      <th>Age</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Jill</td>
      <td>Smith</td>
      <td>50</td>
    </tr>
    <tr>
      <td>Eve</td>
      <td>Jackson</td>
      <td>94</td>
    </tr>
  </tbody>
</table>
```

## Basic syntax


```r
library(tableHTML)

mtcars %>% 
  head(5) %>% 
  tableHTML(widths = c(140, rep(50, 11)))
```

<!--html_preserve-->
<table style="border-collapse:collapse;" class=table_2656 border=1>
<col width="140">
<col width="50">
<col width="50">
<col width="50">
<col width="50">
<col width="50">
<col width="50">
<col width="50">
<col width="50">
<col width="50">
<col width="50">
<col width="50">
<thead>
<tr>
  <th id="tableHTML_header_1"> </th>
  <th id="tableHTML_header_2">mpg</th>
  <th id="tableHTML_header_3">cyl</th>
  <th id="tableHTML_header_4">disp</th>
  <th id="tableHTML_header_5">hp</th>
  <th id="tableHTML_header_6">drat</th>
  <th id="tableHTML_header_7">wt</th>
  <th id="tableHTML_header_8">qsec</th>
  <th id="tableHTML_header_9">vs</th>
  <th id="tableHTML_header_10">am</th>
  <th id="tableHTML_header_11">gear</th>
  <th id="tableHTML_header_12">carb</th>
</tr>
</thead>
<tbody>
<tr>
  <td id="tableHTML_rownames">Mazda RX4</td>
  <td id="tableHTML_column_1">21</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">160</td>
  <td id="tableHTML_column_4">110</td>
  <td id="tableHTML_column_5">3.9</td>
  <td id="tableHTML_column_6">2.62</td>
  <td id="tableHTML_column_7">16.46</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">1</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Mazda RX4 Wag</td>
  <td id="tableHTML_column_1">21</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">160</td>
  <td id="tableHTML_column_4">110</td>
  <td id="tableHTML_column_5">3.9</td>
  <td id="tableHTML_column_6">2.875</td>
  <td id="tableHTML_column_7">17.02</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">1</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Datsun 710</td>
  <td id="tableHTML_column_1">22.8</td>
  <td id="tableHTML_column_2">4</td>
  <td id="tableHTML_column_3">108</td>
  <td id="tableHTML_column_4">93</td>
  <td id="tableHTML_column_5">3.85</td>
  <td id="tableHTML_column_6">2.32</td>
  <td id="tableHTML_column_7">18.61</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">1</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">1</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Hornet 4 Drive</td>
  <td id="tableHTML_column_1">21.4</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">258</td>
  <td id="tableHTML_column_4">110</td>
  <td id="tableHTML_column_5">3.08</td>
  <td id="tableHTML_column_6">3.215</td>
  <td id="tableHTML_column_7">19.44</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">1</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Hornet Sportabout</td>
  <td id="tableHTML_column_1">18.7</td>
  <td id="tableHTML_column_2">8</td>
  <td id="tableHTML_column_3">360</td>
  <td id="tableHTML_column_4">175</td>
  <td id="tableHTML_column_5">3.15</td>
  <td id="tableHTML_column_6">3.44</td>
  <td id="tableHTML_column_7">17.02</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">2</td>
</tr>
</tbody>
</table><!--/html_preserve-->


## Features of tableHTML 

- New headers
- Second headers
- Row names
- Row groups
- Add a caption / footer

<br>


```r
mtcars %>% 
  head(14) %>% 
  tableHTML(widths = c(120, 140, rep(45, 11)),
            second_headers = list(c(2, 2, 4, 5), c('', 'col1', 'col2', 'col3')),
            row_groups = list(c(7, 7), c('Group1', 'Group2')),
            caption = 'This is a caption',
            footer = 'This is a footer')
```

## Example 

<!--html_preserve-->
<table style="border-collapse:collapse;" class=table_4383 border=1>
<caption>This is a caption</caption>
<caption id="footer" align="bottom">This is a footer</caption>
<col width="120">
<col width="140">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<thead>
<tr>
  <th colspan=2 id="tableHTML_second_header_1"></th>
  <th colspan=2 id="tableHTML_second_header_2">col1</th>
  <th colspan=4 id="tableHTML_second_header_3">col2</th>
  <th colspan=5 id="tableHTML_second_header_4">col3</th>
</tr>
<tr>
  <th id="tableHTML_header_0"></th>
  <th id="tableHTML_header_1"> </th>
  <th id="tableHTML_header_2">mpg</th>
  <th id="tableHTML_header_3">cyl</th>
  <th id="tableHTML_header_4">disp</th>
  <th id="tableHTML_header_5">hp</th>
  <th id="tableHTML_header_6">drat</th>
  <th id="tableHTML_header_7">wt</th>
  <th id="tableHTML_header_8">qsec</th>
  <th id="tableHTML_header_9">vs</th>
  <th id="tableHTML_header_10">am</th>
  <th id="tableHTML_header_11">gear</th>
  <th id="tableHTML_header_12">carb</th>
</tr>
</thead>
<tbody>
<tr>
  <td id="tableHTML_row_groups" rowspan="7">Group1</td>
  <td id="tableHTML_rownames">Mazda RX4</td>
  <td id="tableHTML_column_1">21</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">160</td>
  <td id="tableHTML_column_4">110</td>
  <td id="tableHTML_column_5">3.9</td>
  <td id="tableHTML_column_6">2.62</td>
  <td id="tableHTML_column_7">16.46</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">1</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Mazda RX4 Wag</td>
  <td id="tableHTML_column_1">21</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">160</td>
  <td id="tableHTML_column_4">110</td>
  <td id="tableHTML_column_5">3.9</td>
  <td id="tableHTML_column_6">2.875</td>
  <td id="tableHTML_column_7">17.02</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">1</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Datsun 710</td>
  <td id="tableHTML_column_1">22.8</td>
  <td id="tableHTML_column_2">4</td>
  <td id="tableHTML_column_3">108</td>
  <td id="tableHTML_column_4">93</td>
  <td id="tableHTML_column_5">3.85</td>
  <td id="tableHTML_column_6">2.32</td>
  <td id="tableHTML_column_7">18.61</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">1</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">1</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Hornet 4 Drive</td>
  <td id="tableHTML_column_1">21.4</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">258</td>
  <td id="tableHTML_column_4">110</td>
  <td id="tableHTML_column_5">3.08</td>
  <td id="tableHTML_column_6">3.215</td>
  <td id="tableHTML_column_7">19.44</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">1</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Hornet Sportabout</td>
  <td id="tableHTML_column_1">18.7</td>
  <td id="tableHTML_column_2">8</td>
  <td id="tableHTML_column_3">360</td>
  <td id="tableHTML_column_4">175</td>
  <td id="tableHTML_column_5">3.15</td>
  <td id="tableHTML_column_6">3.44</td>
  <td id="tableHTML_column_7">17.02</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">2</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Valiant</td>
  <td id="tableHTML_column_1">18.1</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">225</td>
  <td id="tableHTML_column_4">105</td>
  <td id="tableHTML_column_5">2.76</td>
  <td id="tableHTML_column_6">3.46</td>
  <td id="tableHTML_column_7">20.22</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">1</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Duster 360</td>
  <td id="tableHTML_column_1">14.3</td>
  <td id="tableHTML_column_2">8</td>
  <td id="tableHTML_column_3">360</td>
  <td id="tableHTML_column_4">245</td>
  <td id="tableHTML_column_5">3.21</td>
  <td id="tableHTML_column_6">3.57</td>
  <td id="tableHTML_column_7">15.84</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">4</td>
</tr>
<tr>
  <td id="tableHTML_row_groups" rowspan="7">Group2</td>
  <td id="tableHTML_rownames">Merc 240D</td>
  <td id="tableHTML_column_1">24.4</td>
  <td id="tableHTML_column_2">4</td>
  <td id="tableHTML_column_3">146.7</td>
  <td id="tableHTML_column_4">62</td>
  <td id="tableHTML_column_5">3.69</td>
  <td id="tableHTML_column_6">3.19</td>
  <td id="tableHTML_column_7">20</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">2</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Merc 230</td>
  <td id="tableHTML_column_1">22.8</td>
  <td id="tableHTML_column_2">4</td>
  <td id="tableHTML_column_3">140.8</td>
  <td id="tableHTML_column_4">95</td>
  <td id="tableHTML_column_5">3.92</td>
  <td id="tableHTML_column_6">3.15</td>
  <td id="tableHTML_column_7">22.9</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">2</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Merc 280</td>
  <td id="tableHTML_column_1">19.2</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">167.6</td>
  <td id="tableHTML_column_4">123</td>
  <td id="tableHTML_column_5">3.92</td>
  <td id="tableHTML_column_6">3.44</td>
  <td id="tableHTML_column_7">18.3</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Merc 280C</td>
  <td id="tableHTML_column_1">17.8</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">167.6</td>
  <td id="tableHTML_column_4">123</td>
  <td id="tableHTML_column_5">3.92</td>
  <td id="tableHTML_column_6">3.44</td>
  <td id="tableHTML_column_7">18.9</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Merc 450SE</td>
  <td id="tableHTML_column_1">16.4</td>
  <td id="tableHTML_column_2">8</td>
  <td id="tableHTML_column_3">275.8</td>
  <td id="tableHTML_column_4">180</td>
  <td id="tableHTML_column_5">3.07</td>
  <td id="tableHTML_column_6">4.07</td>
  <td id="tableHTML_column_7">17.4</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">3</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Merc 450SL</td>
  <td id="tableHTML_column_1">17.3</td>
  <td id="tableHTML_column_2">8</td>
  <td id="tableHTML_column_3">275.8</td>
  <td id="tableHTML_column_4">180</td>
  <td id="tableHTML_column_5">3.07</td>
  <td id="tableHTML_column_6">3.73</td>
  <td id="tableHTML_column_7">17.6</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">3</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Merc 450SLC</td>
  <td id="tableHTML_column_1">15.2</td>
  <td id="tableHTML_column_2">8</td>
  <td id="tableHTML_column_3">275.8</td>
  <td id="tableHTML_column_4">180</td>
  <td id="tableHTML_column_5">3.07</td>
  <td id="tableHTML_column_6">3.78</td>
  <td id="tableHTML_column_7">18</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">3</td>
</tr>
</tbody>
</table><!--/html_preserve-->

## Adding a table class

- The class argument sets the class name for the table
- The default will be of the form table_xxx (random 4-digit number)
- This makes it easier to add css to it in case there are multiple tables


```r
mtcars %>% 
  tableHTML(widths = c(140, rep(50, 11))) %>% 
  str()
```

```
## Classes 'tableHTML', 'html', 'character'  atomic [1:1] 
## <table style="border-collapse:collapse;" class=table_7152 border=1>
## <col width="140">
## <col width="50">
## <col widt| __truncated__
##   ..- attr(*, "html")= logi TRUE
##   ..- attr(*, "headers")= chr [1:11] "mpg" "cyl" "disp" "hp" ...
##   ..- attr(*, "nrows")= int 32
##   ..- attr(*, "ncols")= int 11
##   ..- attr(*, "col_classes")= chr [1:11] "numeric" "numeric" "numeric" "numeric" ...
##   ..- attr(*, "rownames")= logi TRUE
##   ..- attr(*, "row_groups")= logi FALSE
##   ..- attr(*, "second_headers")= logi FALSE
```

## The add_css_*() family of functions

Currently the package offers the following add_css functions which add CSS to their respective part of the HTML table:

- add_css_caption
- add_css_column
- add_css_conditional_column
- add_css_footer
- add_css_header
- add_css_row
- add_css_second_header
- add_css_table
- add_css_tbody
- add_css_thead

## Example of how some of the add_css_* <br> functions can be used


```r
mtcars[1:15, ] %>%
  tableHTML(widths = c(140, rep(45, 11)),
            second_headers = list(c(3, 4, 5), 
                                  c('team1', 'team2', 'team3')),
            caption = 'Table of Cars',
            footer = 'Figure 1. Stats for famous cars') %>% 
  add_css_second_header(css = list(c('height', 'background-color', 'font-size'), 
                                   c('40px', ' #e6e6e6', '30px')),
                        second_headers = 1:3) %>%
  add_css_header(css = list(c('height', 'background-color'), 
                            c('30px', ' #e6e6e6')),
                 headers = 1:12) %>%
  add_css_row(css = list('background-color', '#f2f2f2'),
              rows = even(1:17)) %>%
  add_css_row(css = list('background-color', '#e6f0ff'),
              rows = odd(1:17)) %>%
  add_css_column(css = list('text-align', 'center'), 
                 columns = names(mtcars)) %>%
  add_css_caption(css = list(c('text-align', 'font-size', 'color'),
                             c('center', '20px', 'black'))) %>%
  add_css_footer(css = list(c('text-align', 'color'),
                            c('left', 'black')))
```

## Example of how some of the add_css_* <br> functions can be used

<!--html_preserve-->
<table style="border-collapse:collapse;" class=table_3969 border=1>
<caption style="text-align:center;font-size:20px;color:black;">Table of Cars</caption>
<caption id="footer" align="bottom" style="text-align:left;color:black;">Figure 1. Stats for famous cars</caption>
<col width="140">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<thead>
<tr style="background-color:#e6f0ff;">
  <th colspan=3 id="tableHTML_second_header_1" style="height:40px;background-color: #e6e6e6;font-size:30px;">team1</th>
  <th colspan=4 id="tableHTML_second_header_2" style="height:40px;background-color: #e6e6e6;font-size:30px;">team2</th>
  <th colspan=5 id="tableHTML_second_header_3" style="height:40px;background-color: #e6e6e6;font-size:30px;">team3</th>
</tr>
<tr style="background-color:#f2f2f2;">
  <th id="tableHTML_header_1" style="height:30px;background-color: #e6e6e6;"> </th>
  <th id="tableHTML_header_2" style="height:30px;background-color: #e6e6e6;">mpg</th>
  <th id="tableHTML_header_3" style="height:30px;background-color: #e6e6e6;">cyl</th>
  <th id="tableHTML_header_4" style="height:30px;background-color: #e6e6e6;">disp</th>
  <th id="tableHTML_header_5" style="height:30px;background-color: #e6e6e6;">hp</th>
  <th id="tableHTML_header_6" style="height:30px;background-color: #e6e6e6;">drat</th>
  <th id="tableHTML_header_7" style="height:30px;background-color: #e6e6e6;">wt</th>
  <th id="tableHTML_header_8" style="height:30px;background-color: #e6e6e6;">qsec</th>
  <th id="tableHTML_header_9" style="height:30px;background-color: #e6e6e6;">vs</th>
  <th id="tableHTML_header_10" style="height:30px;background-color: #e6e6e6;">am</th>
  <th id="tableHTML_header_11" style="height:30px;background-color: #e6e6e6;">gear</th>
  <th id="tableHTML_header_12" style="height:30px;background-color: #e6e6e6;">carb</th>
</tr>
</thead>
<tbody>
<tr style="background-color:#e6f0ff;">
  <td id="tableHTML_rownames">Mazda RX4</td>
  <td id="tableHTML_column_1" style="text-align:center;">21</td>
  <td id="tableHTML_column_2" style="text-align:center;">6</td>
  <td id="tableHTML_column_3" style="text-align:center;">160</td>
  <td id="tableHTML_column_4" style="text-align:center;">110</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.9</td>
  <td id="tableHTML_column_6" style="text-align:center;">2.62</td>
  <td id="tableHTML_column_7" style="text-align:center;">16.46</td>
  <td id="tableHTML_column_8" style="text-align:center;">0</td>
  <td id="tableHTML_column_9" style="text-align:center;">1</td>
  <td id="tableHTML_column_10" style="text-align:center;">4</td>
  <td id="tableHTML_column_11" style="text-align:center;">4</td>
</tr>
<tr style="background-color:#f2f2f2;">
  <td id="tableHTML_rownames">Mazda RX4 Wag</td>
  <td id="tableHTML_column_1" style="text-align:center;">21</td>
  <td id="tableHTML_column_2" style="text-align:center;">6</td>
  <td id="tableHTML_column_3" style="text-align:center;">160</td>
  <td id="tableHTML_column_4" style="text-align:center;">110</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.9</td>
  <td id="tableHTML_column_6" style="text-align:center;">2.875</td>
  <td id="tableHTML_column_7" style="text-align:center;">17.02</td>
  <td id="tableHTML_column_8" style="text-align:center;">0</td>
  <td id="tableHTML_column_9" style="text-align:center;">1</td>
  <td id="tableHTML_column_10" style="text-align:center;">4</td>
  <td id="tableHTML_column_11" style="text-align:center;">4</td>
</tr>
<tr style="background-color:#e6f0ff;">
  <td id="tableHTML_rownames">Datsun 710</td>
  <td id="tableHTML_column_1" style="text-align:center;">22.8</td>
  <td id="tableHTML_column_2" style="text-align:center;">4</td>
  <td id="tableHTML_column_3" style="text-align:center;">108</td>
  <td id="tableHTML_column_4" style="text-align:center;">93</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.85</td>
  <td id="tableHTML_column_6" style="text-align:center;">2.32</td>
  <td id="tableHTML_column_7" style="text-align:center;">18.61</td>
  <td id="tableHTML_column_8" style="text-align:center;">1</td>
  <td id="tableHTML_column_9" style="text-align:center;">1</td>
  <td id="tableHTML_column_10" style="text-align:center;">4</td>
  <td id="tableHTML_column_11" style="text-align:center;">1</td>
</tr>
<tr style="background-color:#f2f2f2;">
  <td id="tableHTML_rownames">Hornet 4 Drive</td>
  <td id="tableHTML_column_1" style="text-align:center;">21.4</td>
  <td id="tableHTML_column_2" style="text-align:center;">6</td>
  <td id="tableHTML_column_3" style="text-align:center;">258</td>
  <td id="tableHTML_column_4" style="text-align:center;">110</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.08</td>
  <td id="tableHTML_column_6" style="text-align:center;">3.215</td>
  <td id="tableHTML_column_7" style="text-align:center;">19.44</td>
  <td id="tableHTML_column_8" style="text-align:center;">1</td>
  <td id="tableHTML_column_9" style="text-align:center;">0</td>
  <td id="tableHTML_column_10" style="text-align:center;">3</td>
  <td id="tableHTML_column_11" style="text-align:center;">1</td>
</tr>
<tr style="background-color:#e6f0ff;">
  <td id="tableHTML_rownames">Hornet Sportabout</td>
  <td id="tableHTML_column_1" style="text-align:center;">18.7</td>
  <td id="tableHTML_column_2" style="text-align:center;">8</td>
  <td id="tableHTML_column_3" style="text-align:center;">360</td>
  <td id="tableHTML_column_4" style="text-align:center;">175</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.15</td>
  <td id="tableHTML_column_6" style="text-align:center;">3.44</td>
  <td id="tableHTML_column_7" style="text-align:center;">17.02</td>
  <td id="tableHTML_column_8" style="text-align:center;">0</td>
  <td id="tableHTML_column_9" style="text-align:center;">0</td>
  <td id="tableHTML_column_10" style="text-align:center;">3</td>
  <td id="tableHTML_column_11" style="text-align:center;">2</td>
</tr>
</tbody>
</table><!--/html_preserve-->

## Conditional formatting


```r
mtcars %>% 
  head(10) %>% 
  tableHTML(widths = c(140, rep(45, 11))) %>% 
  add_css_conditional_column(conditional = ">=",
                             value = 300,
                             css = list("background-color", 
                                        add_alpha("red", 0.5)),
                             columns = 3) %>% 
  add_css_conditional_column(conditional = "between",
                             between = c(15, 17),
                             css = list("background-color", 
                                        add_alpha("orange", 0.5)),
                             columns = 7) %>% 
  add_css_conditional_column(conditional = "min",
                             css = list("background-color", 
                                        add_alpha("green", 0.5)),
                             columns = 4:6,
                             same_scale = FALSE)
```

## Conditional formatting

<!--html_preserve-->
<table style="border-collapse:collapse;" class=table_2157 border=1>
<col width="140">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<thead>
<tr>
  <th id="tableHTML_header_1"> </th>
  <th id="tableHTML_header_2">mpg</th>
  <th id="tableHTML_header_3">cyl</th>
  <th id="tableHTML_header_4">disp</th>
  <th id="tableHTML_header_5">hp</th>
  <th id="tableHTML_header_6">drat</th>
  <th id="tableHTML_header_7">wt</th>
  <th id="tableHTML_header_8">qsec</th>
  <th id="tableHTML_header_9">vs</th>
  <th id="tableHTML_header_10">am</th>
  <th id="tableHTML_header_11">gear</th>
  <th id="tableHTML_header_12">carb</th>
</tr>
</thead>
<tbody>
<tr>
  <td id="tableHTML_rownames">Mazda RX4</td>
  <td id="tableHTML_column_1">21</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">160</td>
  <td id="tableHTML_column_4">110</td>
  <td id="tableHTML_column_5">3.9</td>
  <td id="tableHTML_column_6">2.62</td>
  <td id="tableHTML_column_7" style="background-color:#FFA50080;">16.46</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">1</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Mazda RX4 Wag</td>
  <td id="tableHTML_column_1">21</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">160</td>
  <td id="tableHTML_column_4">110</td>
  <td id="tableHTML_column_5">3.9</td>
  <td id="tableHTML_column_6">2.875</td>
  <td id="tableHTML_column_7">17.02</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">1</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Datsun 710</td>
  <td id="tableHTML_column_1">22.8</td>
  <td id="tableHTML_column_2">4</td>
  <td id="tableHTML_column_3">108</td>
  <td id="tableHTML_column_4">93</td>
  <td id="tableHTML_column_5">3.85</td>
  <td id="tableHTML_column_6" style="background-color:#00FF0080;">2.32</td>
  <td id="tableHTML_column_7">18.61</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">1</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">1</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Hornet 4 Drive</td>
  <td id="tableHTML_column_1">21.4</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">258</td>
  <td id="tableHTML_column_4">110</td>
  <td id="tableHTML_column_5">3.08</td>
  <td id="tableHTML_column_6">3.215</td>
  <td id="tableHTML_column_7">19.44</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">1</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Hornet Sportabout</td>
  <td id="tableHTML_column_1">18.7</td>
  <td id="tableHTML_column_2">8</td>
  <td id="tableHTML_column_3" style="background-color:#FF000080;">360</td>
  <td id="tableHTML_column_4">175</td>
  <td id="tableHTML_column_5">3.15</td>
  <td id="tableHTML_column_6">3.44</td>
  <td id="tableHTML_column_7">17.02</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">2</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Valiant</td>
  <td id="tableHTML_column_1">18.1</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">225</td>
  <td id="tableHTML_column_4">105</td>
  <td id="tableHTML_column_5" style="background-color:#00FF0080;">2.76</td>
  <td id="tableHTML_column_6">3.46</td>
  <td id="tableHTML_column_7">20.22</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">1</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Duster 360</td>
  <td id="tableHTML_column_1">14.3</td>
  <td id="tableHTML_column_2">8</td>
  <td id="tableHTML_column_3" style="background-color:#FF000080;">360</td>
  <td id="tableHTML_column_4">245</td>
  <td id="tableHTML_column_5">3.21</td>
  <td id="tableHTML_column_6">3.57</td>
  <td id="tableHTML_column_7" style="background-color:#FFA50080;">15.84</td>
  <td id="tableHTML_column_8">0</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">3</td>
  <td id="tableHTML_column_11">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Merc 240D</td>
  <td id="tableHTML_column_1">24.4</td>
  <td id="tableHTML_column_2">4</td>
  <td id="tableHTML_column_3">146.7</td>
  <td id="tableHTML_column_4" style="background-color:#00FF0080;">62</td>
  <td id="tableHTML_column_5">3.69</td>
  <td id="tableHTML_column_6">3.19</td>
  <td id="tableHTML_column_7">20</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">2</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Merc 230</td>
  <td id="tableHTML_column_1">22.8</td>
  <td id="tableHTML_column_2">4</td>
  <td id="tableHTML_column_3">140.8</td>
  <td id="tableHTML_column_4">95</td>
  <td id="tableHTML_column_5">3.92</td>
  <td id="tableHTML_column_6">3.15</td>
  <td id="tableHTML_column_7">22.9</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">2</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Merc 280</td>
  <td id="tableHTML_column_1">19.2</td>
  <td id="tableHTML_column_2">6</td>
  <td id="tableHTML_column_3">167.6</td>
  <td id="tableHTML_column_4">123</td>
  <td id="tableHTML_column_5">3.92</td>
  <td id="tableHTML_column_6">3.44</td>
  <td id="tableHTML_column_7">18.3</td>
  <td id="tableHTML_column_8">1</td>
  <td id="tableHTML_column_9">0</td>
  <td id="tableHTML_column_10">4</td>
  <td id="tableHTML_column_11">4</td>
</tr>
</tbody>
</table><!--/html_preserve-->


## Colour ranking


```r
set.seed(1234)
matrix(sample(1:5, 50, replace = TRUE), ncol = 10) %>% 
tableHTML(widths = rep(45, 10),
          rownames = FALSE) %>% 
  add_css_conditional_column(colour_rank_theme = "RAG",
                             columns = 1:10)
```

<!--html_preserve-->
<table style="border-collapse:collapse;" class=table_1664 border=1>
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<thead>
<tr>
  <th id="tableHTML_header_1">V1</th>
  <th id="tableHTML_header_2">V2</th>
  <th id="tableHTML_header_3">V3</th>
  <th id="tableHTML_header_4">V4</th>
  <th id="tableHTML_header_5">V5</th>
  <th id="tableHTML_header_6">V6</th>
  <th id="tableHTML_header_7">V7</th>
  <th id="tableHTML_header_8">V8</th>
  <th id="tableHTML_header_9">V9</th>
  <th id="tableHTML_header_10">V10</th>
</tr>
</thead>
<tbody>
<tr>
  <td id="tableHTML_column_1" style="background-color:#86C183;">1</td>
  <td id="tableHTML_column_2" style="background-color:#EFAE7F;">4</td>
  <td id="tableHTML_column_3" style="background-color:#EFAE7F;">4</td>
  <td id="tableHTML_column_4" style="background-color:#F8696B;">5</td>
  <td id="tableHTML_column_5" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_6" style="background-color:#F8696B;">5</td>
  <td id="tableHTML_column_7" style="background-color:#FCEC92;">3</td>
  <td id="tableHTML_column_8" style="background-color:#EFAE7F;">4</td>
  <td id="tableHTML_column_9" style="background-color:#FCEC92;">3</td>
  <td id="tableHTML_column_10" style="background-color:#FCEC92;">3</td>
</tr>
<tr>
  <td id="tableHTML_column_1" style="background-color:#EFAE7F;">4</td>
  <td id="tableHTML_column_2" style="background-color:#86C183;">1</td>
  <td id="tableHTML_column_3" style="background-color:#FCEC92;">3</td>
  <td id="tableHTML_column_4" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_5" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_6" style="background-color:#FCEC92;">3</td>
  <td id="tableHTML_column_7" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_8" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_9" style="background-color:#EFAE7F;">4</td>
  <td id="tableHTML_column_10" style="background-color:#EFAE7F;">4</td>
</tr>
<tr>
  <td id="tableHTML_column_1" style="background-color:#EFAE7F;">4</td>
  <td id="tableHTML_column_2" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_3" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_4" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_5" style="background-color:#86C183;">1</td>
  <td id="tableHTML_column_6" style="background-color:#F8696B;">5</td>
  <td id="tableHTML_column_7" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_8" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_9" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_10" style="background-color:#FCEC92;">3</td>
</tr>
<tr>
  <td id="tableHTML_column_1" style="background-color:#EFAE7F;">4</td>
  <td id="tableHTML_column_2" style="background-color:#EFAE7F;">4</td>
  <td id="tableHTML_column_3" style="background-color:#F8696B;">5</td>
  <td id="tableHTML_column_4" style="background-color:#86C183;">1</td>
  <td id="tableHTML_column_5" style="background-color:#86C183;">1</td>
  <td id="tableHTML_column_6" style="background-color:#F8696B;">5</td>
  <td id="tableHTML_column_7" style="background-color:#FCEC92;">3</td>
  <td id="tableHTML_column_8" style="background-color:#F8696B;">5</td>
  <td id="tableHTML_column_9" style="background-color:#EFAE7F;">4</td>
  <td id="tableHTML_column_10" style="background-color:#B9D48A;">2</td>
</tr>
<tr>
  <td id="tableHTML_column_1" style="background-color:#F8696B;">5</td>
  <td id="tableHTML_column_2" style="background-color:#FCEC92;">3</td>
  <td id="tableHTML_column_3" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_4" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_5" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_6" style="background-color:#86C183;">1</td>
  <td id="tableHTML_column_7" style="background-color:#86C183;">1</td>
  <td id="tableHTML_column_8" style="background-color:#F8696B;">5</td>
  <td id="tableHTML_column_9" style="background-color:#B9D48A;">2</td>
  <td id="tableHTML_column_10" style="background-color:#EFAE7F;">4</td>
</tr>
</tbody>
</table><!--/html_preserve-->

## Built-in themes


```r
mtcars %>% 
  head(5) %>% 
  tableHTML(widths = c(140, rep(45, 11)),
            theme = "scientific")
```

<!--html_preserve-->
<table style="border-collapse:collapse;" class=table_3787 border=0>
<col width="140">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<thead>
<tr style="border-bottom:2px solid black;border-top:3px solid black;">
  <th id="tableHTML_header_1"> </th>
  <th id="tableHTML_header_2">mpg</th>
  <th id="tableHTML_header_3">cyl</th>
  <th id="tableHTML_header_4">disp</th>
  <th id="tableHTML_header_5">hp</th>
  <th id="tableHTML_header_6">drat</th>
  <th id="tableHTML_header_7">wt</th>
  <th id="tableHTML_header_8">qsec</th>
  <th id="tableHTML_header_9">vs</th>
  <th id="tableHTML_header_10">am</th>
  <th id="tableHTML_header_11">gear</th>
  <th id="tableHTML_header_12">carb</th>
</tr>
</thead>
<tbody>
<tr>
  <td id="tableHTML_rownames">Mazda RX4</td>
  <td id="tableHTML_column_1" style="text-align:center;">21</td>
  <td id="tableHTML_column_2" style="text-align:center;">6</td>
  <td id="tableHTML_column_3" style="text-align:center;">160</td>
  <td id="tableHTML_column_4" style="text-align:center;">110</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.9</td>
  <td id="tableHTML_column_6" style="text-align:center;">2.62</td>
  <td id="tableHTML_column_7" style="text-align:center;">16.46</td>
  <td id="tableHTML_column_8" style="text-align:center;">0</td>
  <td id="tableHTML_column_9" style="text-align:center;">1</td>
  <td id="tableHTML_column_10" style="text-align:center;">4</td>
  <td id="tableHTML_column_11" style="text-align:center;">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Mazda RX4 Wag</td>
  <td id="tableHTML_column_1" style="text-align:center;">21</td>
  <td id="tableHTML_column_2" style="text-align:center;">6</td>
  <td id="tableHTML_column_3" style="text-align:center;">160</td>
  <td id="tableHTML_column_4" style="text-align:center;">110</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.9</td>
  <td id="tableHTML_column_6" style="text-align:center;">2.875</td>
  <td id="tableHTML_column_7" style="text-align:center;">17.02</td>
  <td id="tableHTML_column_8" style="text-align:center;">0</td>
  <td id="tableHTML_column_9" style="text-align:center;">1</td>
  <td id="tableHTML_column_10" style="text-align:center;">4</td>
  <td id="tableHTML_column_11" style="text-align:center;">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Datsun 710</td>
  <td id="tableHTML_column_1" style="text-align:center;">22.8</td>
  <td id="tableHTML_column_2" style="text-align:center;">4</td>
  <td id="tableHTML_column_3" style="text-align:center;">108</td>
  <td id="tableHTML_column_4" style="text-align:center;">93</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.85</td>
  <td id="tableHTML_column_6" style="text-align:center;">2.32</td>
  <td id="tableHTML_column_7" style="text-align:center;">18.61</td>
  <td id="tableHTML_column_8" style="text-align:center;">1</td>
  <td id="tableHTML_column_9" style="text-align:center;">1</td>
  <td id="tableHTML_column_10" style="text-align:center;">4</td>
  <td id="tableHTML_column_11" style="text-align:center;">1</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Hornet 4 Drive</td>
  <td id="tableHTML_column_1" style="text-align:center;">21.4</td>
  <td id="tableHTML_column_2" style="text-align:center;">6</td>
  <td id="tableHTML_column_3" style="text-align:center;">258</td>
  <td id="tableHTML_column_4" style="text-align:center;">110</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.08</td>
  <td id="tableHTML_column_6" style="text-align:center;">3.215</td>
  <td id="tableHTML_column_7" style="text-align:center;">19.44</td>
  <td id="tableHTML_column_8" style="text-align:center;">1</td>
  <td id="tableHTML_column_9" style="text-align:center;">0</td>
  <td id="tableHTML_column_10" style="text-align:center;">3</td>
  <td id="tableHTML_column_11" style="text-align:center;">1</td>
</tr>
<tr style="border-bottom:3px solid black;">
  <td id="tableHTML_rownames">Hornet Sportabout</td>
  <td id="tableHTML_column_1" style="text-align:center;">18.7</td>
  <td id="tableHTML_column_2" style="text-align:center;">8</td>
  <td id="tableHTML_column_3" style="text-align:center;">360</td>
  <td id="tableHTML_column_4" style="text-align:center;">175</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.15</td>
  <td id="tableHTML_column_6" style="text-align:center;">3.44</td>
  <td id="tableHTML_column_7" style="text-align:center;">17.02</td>
  <td id="tableHTML_column_8" style="text-align:center;">0</td>
  <td id="tableHTML_column_9" style="text-align:center;">0</td>
  <td id="tableHTML_column_10" style="text-align:center;">3</td>
  <td id="tableHTML_column_11" style="text-align:center;">2</td>
</tr>
</tbody>
</table><!--/html_preserve-->

## Built-in themes


```r
mtcars %>% 
  head(5) %>% 
  tableHTML(widths = c(140, rep(45, 11)),
            theme = "rshiny-blue")
```

<!--html_preserve-->
<table style="border-collapse:collapse;" class=table_7455 border=0>
<col width="140">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<col width="45">
<thead>
<tr style="background-color:#428bca;">
  <th id="tableHTML_header_1"> </th>
  <th id="tableHTML_header_2">mpg</th>
  <th id="tableHTML_header_3">cyl</th>
  <th id="tableHTML_header_4">disp</th>
  <th id="tableHTML_header_5">hp</th>
  <th id="tableHTML_header_6">drat</th>
  <th id="tableHTML_header_7">wt</th>
  <th id="tableHTML_header_8">qsec</th>
  <th id="tableHTML_header_9">vs</th>
  <th id="tableHTML_header_10">am</th>
  <th id="tableHTML_header_11">gear</th>
  <th id="tableHTML_header_12">carb</th>
</tr>
</thead>
<tbody>
<tr>
  <td id="tableHTML_rownames">Mazda RX4</td>
  <td id="tableHTML_column_1" style="text-align:center;">21</td>
  <td id="tableHTML_column_2" style="text-align:center;">6</td>
  <td id="tableHTML_column_3" style="text-align:center;">160</td>
  <td id="tableHTML_column_4" style="text-align:center;">110</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.9</td>
  <td id="tableHTML_column_6" style="text-align:center;">2.62</td>
  <td id="tableHTML_column_7" style="text-align:center;">16.46</td>
  <td id="tableHTML_column_8" style="text-align:center;">0</td>
  <td id="tableHTML_column_9" style="text-align:center;">1</td>
  <td id="tableHTML_column_10" style="text-align:center;">4</td>
  <td id="tableHTML_column_11" style="text-align:center;">4</td>
</tr>
<tr style="background-color:#f2f2f2;">
  <td id="tableHTML_rownames">Mazda RX4 Wag</td>
  <td id="tableHTML_column_1" style="text-align:center;">21</td>
  <td id="tableHTML_column_2" style="text-align:center;">6</td>
  <td id="tableHTML_column_3" style="text-align:center;">160</td>
  <td id="tableHTML_column_4" style="text-align:center;">110</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.9</td>
  <td id="tableHTML_column_6" style="text-align:center;">2.875</td>
  <td id="tableHTML_column_7" style="text-align:center;">17.02</td>
  <td id="tableHTML_column_8" style="text-align:center;">0</td>
  <td id="tableHTML_column_9" style="text-align:center;">1</td>
  <td id="tableHTML_column_10" style="text-align:center;">4</td>
  <td id="tableHTML_column_11" style="text-align:center;">4</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Datsun 710</td>
  <td id="tableHTML_column_1" style="text-align:center;">22.8</td>
  <td id="tableHTML_column_2" style="text-align:center;">4</td>
  <td id="tableHTML_column_3" style="text-align:center;">108</td>
  <td id="tableHTML_column_4" style="text-align:center;">93</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.85</td>
  <td id="tableHTML_column_6" style="text-align:center;">2.32</td>
  <td id="tableHTML_column_7" style="text-align:center;">18.61</td>
  <td id="tableHTML_column_8" style="text-align:center;">1</td>
  <td id="tableHTML_column_9" style="text-align:center;">1</td>
  <td id="tableHTML_column_10" style="text-align:center;">4</td>
  <td id="tableHTML_column_11" style="text-align:center;">1</td>
</tr>
<tr style="background-color:#f2f2f2;">
  <td id="tableHTML_rownames">Hornet 4 Drive</td>
  <td id="tableHTML_column_1" style="text-align:center;">21.4</td>
  <td id="tableHTML_column_2" style="text-align:center;">6</td>
  <td id="tableHTML_column_3" style="text-align:center;">258</td>
  <td id="tableHTML_column_4" style="text-align:center;">110</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.08</td>
  <td id="tableHTML_column_6" style="text-align:center;">3.215</td>
  <td id="tableHTML_column_7" style="text-align:center;">19.44</td>
  <td id="tableHTML_column_8" style="text-align:center;">1</td>
  <td id="tableHTML_column_9" style="text-align:center;">0</td>
  <td id="tableHTML_column_10" style="text-align:center;">3</td>
  <td id="tableHTML_column_11" style="text-align:center;">1</td>
</tr>
<tr>
  <td id="tableHTML_rownames">Hornet Sportabout</td>
  <td id="tableHTML_column_1" style="text-align:center;">18.7</td>
  <td id="tableHTML_column_2" style="text-align:center;">8</td>
  <td id="tableHTML_column_3" style="text-align:center;">360</td>
  <td id="tableHTML_column_4" style="text-align:center;">175</td>
  <td id="tableHTML_column_5" style="text-align:center;">3.15</td>
  <td id="tableHTML_column_6" style="text-align:center;">3.44</td>
  <td id="tableHTML_column_7" style="text-align:center;">17.02</td>
  <td id="tableHTML_column_8" style="text-align:center;">0</td>
  <td id="tableHTML_column_9" style="text-align:center;">0</td>
  <td id="tableHTML_column_10" style="text-align:center;">3</td>
  <td id="tableHTML_column_11" style="text-align:center;">2</td>
</tr>
</tbody>
</table><!--/html_preserve-->


## Confusion Matrix




```r
cm$table %>% 
  as.data.frame() %>% 
  data.table::dcast(Prediction ~ Reference,
                    value.var = "Freq") %>% 
  tableHTML(rownames = FALSE,
            header = c("", "benign", "malignant"),
            second_headers = list(c(2, 2), 
                                  c("", "Reference")),
            row_groups = list(2,
                              "Prediction"),
            theme = "scientific",
            class = "conf_matrix") %>% 
  add_css_column(columns = c(-1, 1),
                 css = list("font-weight",
                            "bold"))
```


```r
knitr::include_graphics('img/conf_matrix.png')
```

<img src="img/conf_matrix.png" width="480px" />


## Future development

- conditional formatting for rows
- Use d3 to create HTML tables?
- Export images from `tableHTML`

## Last Slide

<h3>Questions?</h3>

<br>
If you need help using the package, there is a `tableHTML` tag on stackoverflow:

https://stackoverflow.com/questions/tagged/tablehtml

<div class = "footer">
if you find any bugs please report them on the issues page on github.

https://github.com/LyzandeR/tableHTML/issues
</div>
