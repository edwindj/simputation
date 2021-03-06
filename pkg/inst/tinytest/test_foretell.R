

## foretell returns correct type

m <- lm(Sepal.Length ~ ., data=iris)
expect_true(inherits(foretell(m,iris),"numeric" ))
            

m <- rpart::rpart(Species ~ ., data=iris)
expect_true(inherits(foretell(m,iris),"factor"))

iris$foo <- sample(c(TRUE,FALSE),150,replace=TRUE)
m <- stats::glm(foo ~ .-Species,data=iris, family="binomial")
expect_true(inherits(foretell(m,newdata=iris),"logical"))
            

m <- rpart::rpart(foo ~ ., data=iris, method="class")
expect_true(inherits(foretell(m, newdata=iris),"logical"))
 
iris[1:3,1] <- NA
m <- rpart::rpart(foo ~ ., data=iris, method="class")
expect_true(inherits(foretell(m, newdata=iris),"logical"))
            


