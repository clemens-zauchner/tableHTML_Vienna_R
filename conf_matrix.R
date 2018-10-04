
library(dplyr)
library(caret)

data(BreastCancer, package = "mlbench")

bc <- BreastCancer[complete.cases(BreastCancer), ] 


# remove id column
bc <- bc[,-1]

# convert factors to numeric
for(i in 1:9) {
  bc[, i] <- as.numeric(as.character(bc[, i]))
}

set.seed(100)
trainDataIndex <- createDataPartition(bc$Class, p = 0.7, list = FALSE)
trainData <- bc[trainDataIndex, ]
testData <- bc[-trainDataIndex, ]

set.seed(666)
orig_fit <- train(Class ~ ., data = trainData, 
                  method = "glm",
                  trControl = trainControl(classProbs = TRUE))

cm <- confusionMatrix(predict(orig_fit, newdata = testData),
                      testData$Class)

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

