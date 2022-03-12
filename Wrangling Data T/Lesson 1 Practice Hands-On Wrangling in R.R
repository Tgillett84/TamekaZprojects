library("dplyr")
library("tidyr")

# Part 1: Please complete the following tasks in R

print(FakeNews)

# 1. Add a column labeled StoryType and fill it with Fake.

FakeNews$StoryType = "Fake"

# 2. Remove the when column.

# FakeNews.drop(['when'], axis=1)

# .drop()	A function where the specified columns are removed from the dataset.

# 3. Separate the url column out so that you can see in one column the website and in the second column the domain. For example, if you have the following in url, it should be broken out like this:
  
FakeNews1 <- separate(FakeNews, url, c("website", "domain"), sep=",")


# 4. Put back together the domain column.

FakeNews2 <- unite(FakeNews1, url, website, domain, sep=",")

#5. Keep only the first ten rows of the data.

FakeNews3 <- FakeNews2[1:10,]
