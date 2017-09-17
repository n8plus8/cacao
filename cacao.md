---
title       : So much chocolate, so little time
subtitle    : Exploratory Cocoa Analysis
author      : NL
job         : Data Analyst
framework   : revealjs      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---




### Exploratory Cocoa Analysis  
NL

---

### The data

Flavors of Cacao  
available at [http://flavorsofcacao.com/index.html](http://flavorsofcacao.com/index.html)  

Expert ratings of over 1,700 individual chocolate bars, along with information on
- regional origin
- percentage of cocoa
- variety of chocolate bean used
- where the beans were grown



---


#### Where are most of the rated bars produced?

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)


---

#### Where are the highest and lowest rated bars produced?
![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png)

Vietnam: [The Best Chocolate You've Never Tasted](https://www.nytimes.com/2016/03/06/t-magazine/food/marou-vietnamese-chocolate.html)

---

#### ...and where do they source their beans?
![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4-1.png)

<small>Perhaps there are more low quality beans from Ecuador, Peru, and Venezuela</small>  
<small>You want Brazilian and Vietnamese beans.</small>

---

#### Where do Australia (top 5) & U.K. (bottom 5) source their beans?
<small>they don't grow their own</small>  
![plot of chunk unnamed-chunk-5](assets/fig/unnamed-chunk-5-1.png)

<small>We see Ecuadorean and Venezuelan beans in low rated U.K. bars</small>

---

#### Is percentage of cocoa correlated with rating?
![plot of chunk unnamed-chunk-6](assets/fig/unnamed-chunk-6-1.png)

Doesn't look like anything to me.

---

#### Distribution of ratings by bean types, Top 10
![plot of chunk unnamed-chunk-7](assets/fig/unnamed-chunk-7-1.png)

[Criollo Porcelana: The holy grail of cocoa beans](https://www.somachocolate.com/blogs/news/18222553-porcelana-finally-after-a-decade-of-waiting)

---

#### Next time you go to whole foods...
Yay &#9786;  
![](assets/img/amedei.jpg)
![](assets/img/domori.jpg)
![](assets/img/marcolini.jpg)
<br>
Nay &#9785;  
![](assets/img/middlebury.jpg)
![](assets/img/frenchbroad.jpg)

---

### Happy eating!
![](assets/img/fc.jpg)

---

[the code](cacao.R)
