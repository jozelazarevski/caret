modelInfo <- list(label = "Random Ferns",
                  library = "rFerns",
                  loop = NULL,
                  type = c('Classification'),
                  parameters = data.frame(parameter = c('depth'),
                                          class = c('numeric'),
                                          label = c('Fern Depth')),
                  grid = function(x, y, len = NULL) 
                    data.frame(depth = unique(floor(seq(1, 16, length = len)))),
                  fit = function(x, y, wts, param, lev, last, classProbs, ...) {
                    if(!is.data.frame(x)) newdata <- as.data.frame(x)
                    rFerns(x, y, depth = param$depth, ...)
                    },
                  predict = function(modelFit, newdata, submodels = NULL) {
                    if(!is.data.frame(newdata)) newdata <- as.data.frame(newdata)
                    predict(modelFit, newdata)
                    },
                  prob = NULL,
                  tags = c("Random Forest", "Ensemble Model", "Bagging", "Implicit Feature Selection"),
                  sort = function(x) x[order(x[,1]),])
