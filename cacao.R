library(tidyverse);library(ggthemes)
choc <- read.csv("choc.csv")


# Where are most of the rated bars produced?
t10 <- data.frame(sort(table(choc$compLoc), decreasing = TRUE)[1:10])
t10$Var1 <- gsub("U.S.A.", "'MURICA!", t10$Var1)
ggplot(data = t10, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity") +
  labs(x = NULL) +
  theme_wsj() +
  coord_flip()


# Where are the highest and lowest rated bars produced?
avgRat <- choc %>%
  group_by(compLoc) %>%
  summarise(avg = mean(Rating), count = n()) %>%
  arrange(desc(avg)) %>%
  filter(count >= 5, !is.na(compLoc))

hiLo <- rbind(head(avgRat, 5), tail(avgRat, 5))
hiLo$grp <- factor(c(rep("Top 5", 5), rep("Bottom 5",5)), levels = c("Top 5", "Bottom 5"))

bars <- ggplot(data = hiLo, aes(x = reorder(compLoc, avg), y = avg, fill = grp)) +
  labs(x = NULL, y = 'Average Rating') +
  geom_bar(stat = 'identity') +
  coord_flip() +
  theme_wsj() +
  scale_fill_gdocs() +
  theme(legend.title = element_blank())
bars


# ...and where do they source their beans?
beans <- choc %>%
filter(compLoc %in% hiLo$compLoc)

beans$compLoc <- factor(beans$compLoc, levels = hiLo$compLoc[10:1])

beans$grp <- ifelse(beans$compLoc %in% hiLo$compLoc[1:5], "Top 5", "Bottom 5") %>%
factor(levels = c("Top 5", "Bottom 5"))
beans <- group_by(beans, compLoc, bOrigin, grp) %>%
summarize(count = n()) %>%
filter(!is.na(bOrigin))#, count > 1)

origin <- ggplot(beans, aes(x = bOrigin, y = count, fill = grp)) +
labs(x = NULL, y = NULL) +
stat_summary(fun.y = sum, geom = "bar") +
coord_flip() +
facet_grid(grp ~ ., scales = "free", space = "free") +
scale_fill_gdocs() +
theme_wsj() +
theme(legend.position = "none")
origin


# Where do Australia (top 5) & U.K. (bottom 5) source their beans?
nogrow <- filter(beans, compLoc %in% c("Australia", "U.K."))

nobeans <- ggplot(nogrow, aes(x = bOrigin, y = count, fill = grp)) +
  labs(x = NULL, y = NULL) +
  stat_summary(fun.y = sum, geom = "bar") +
  coord_flip() +
  facet_wrap(~ compLoc , scales = "free", drop = TRUE) +
  theme_wsj() +
  scale_fill_gdocs() +
  theme(legend.title = element_blank())
nobeans


# Is percentage of cocoa correlated with rating?

r <- round(cor(choc$Rating, choc$pCocoa),2)

p <- ggplot(data = choc, aes(x = pCocoa, y = Rating)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y~x) + 
  labs(title = "Fat equals flavor?",
       subtitle = paste0("r = ", r), x = "Percentage Cocoa") +
  theme_wsj() +
  scale_fill_gdocs()
p


# Distribution of ratings by bean types, Top 10
bType <- filter(choc, !is.na(BeanType))
idx <- group_by(bType, BeanType) %>%
summarize(count = n()) %>%
filter(count >=5)
bType <- filter(bType, BeanType %in% idx$BeanType)

t <- ggplot(data = bType, aes(x = reorder(BeanType, Rating, FUN = median), y = Rating)) +
geom_boxplot() +
labs(x = NULL, y = NULL) +
coord_flip() +
scale_fill_gdocs() +
theme_wsj()
t