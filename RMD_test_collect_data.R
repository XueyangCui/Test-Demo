---
  title: ""
date: "`r Sys.Date()`"
output:
  rmdformats::downcute:
  self_contained: true
default_style: "light"
downcute_theme: "default"
---
  
  ```{r setup, include=FALSE}
# 全局通用代码展示
library(tidyverse)
library(knitr)
#载入表格美化的包
library(kableExtra)
knitr::opts_chunk$set(echo = TRUE)
```

```{r eval=FALSE}
#just present code, but with out run and no output
```

```{r include=FALSE}
#just run but with out present output or code
```

```{r echo=FALSE}
#just result output, but without code presentation 
```

```{r prompt=TRUE, comment=''}
a <- 3*4/2
a
# prompt in order to show code in >, comment='' in order to show result without #
```

```{r test, echo=FALSE, collapse=TRUE}
a <- 2
b <- 3
a 
b
#  in default, collapse means sb fall down or fold sth into smaller shape
```

```{r}

```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:
  
  ```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:
  
  ```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

### Plot

```{r, fig.height = 8,fig.width = 6}

plot(1:10)
```

```{r plot_test, fig.show='hold'}
for (i in 1:2) {
  pie(c(i %% 2, 6), col = c('red', 'yellow'), labels = NA)
}
```

### Plot Settings

```{r set, eval=FALSE}
fig.cap #set plot name
fig.height, fig.width

```

![plot](C:/Users/240yuuka/Pictures/后期图片/CXY01501.jpg)

```{r eval=FALSE}
#follow below path to set local pic
![caption](path/to/pic/){width = 50%}

```

![plot-2](images/CXY01728.jpg)

### Table

| Col1 | Col2 | Col3 |
  |------|------|------|
  |      |      |      |
  |      |      |      |
  |      |      |      |
  
  | col1 | C   |
  |------|-----|
  
  : Table Test

```{r}
x <- 1:10; y <- x^2; lmr <- lm(y ~ x)
co <- summary(lmr)$coefficients
print(co)

#调用kable函数生成表格，使得coefficients更加方便读取
knitr::kable(co, digits = 2, caption = 'try knitr kable')
```

```{r}
kable(iris) %>%
  kable_styling(latex_options = 'striped',
                
                full_width = F  #设置表格的宽度
  )

```

```{r}
x_html <- knitr:: kable(head(rock), "html")
kableExtra::kable_styling(x_html,bootstrap_options = "striped",
                          full_width = F)
```

```{r}
x_html <- knitr:: kable(head(rock), "html")
x_html <- kableExtra::kable_styling(x_html,bootstrap_options = "striped",
                                    full_width = F,
                                    #指定对齐方式为左对齐
                                    position = "left",
                                    #设定表格字体大小
                                    font_size = 20)

kableExtra::row_spec(x_html,1:2,     #函数名子更改为row——spec则结果变为了对行的修改
                     bold = T,
                     color = "white",
                     background = "#D7261E")
```

```{r}
data = plyr::mutate(rock[1:10, ],
                    perm = cell_spec(perm,"html", #format either html or latex
                                     color = "white",
                                     bold = T,
                                     background = spec_color(1:10,
                                                             end = 0.9, # 透明度的设置
                                                             option = "C",#更换底色的颜色配制
                                                             direction = -1)),
                    shape = ifelse(shape > 0.15,
                                   cell_spec(shape,
                                             "html",
                                             color = "white",
                                             background = "#D7261E",
                                             bold = T),
                                   cell_spec(shape, "html",
                                             color = "green",
                                             bold = T)))

x_html <-knitr::kable(data,"html", 
                      escape = F, 
                      # align设置表格的分布是在 l c r 左中右三种
                      align = "c")

# 可以将表格进行一段一段的修改，调整某些行或列的颜色 
x_html <-row_spec(x_html,0, color = "white", background = "#696969" ) 
kable_styling(x_html,"striped") 
```

测试
