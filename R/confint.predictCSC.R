### confint.predictCSC.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: maj 23 2018 (14:08) 
## Version: 
## Last-Updated: okt  1 2020 (09:48) 
##           By: Brice Ozenne
##     Update #: 168
##----------------------------------------------------------------------
## 
### Commentary: 
## 
### Change Log:
##----------------------------------------------------------------------
## 
### Code:

## * confint.predictCSC (documentation)
##' @title Confidence Intervals and Confidence Bands for the Predicted Absolute Risk (Cumulative Incidence Function)
##' @description Confidence intervals and confidence Bands for the predicted absolute risk (cumulative incidence function).
##' @name confint.predictCSC
##' 
##' @param object A \code{predictCSC} object, i.e. output of the \code{predictCSC} function.
##' @param parm not used. For compatibility with the generic method.
##' @param level [numeric, 0-1] Level of confidence.
##' @param absRisk.transform [character] the transformation used to improve coverage
##' of the confidence intervals for the predicted absolute risk in small samples.
##' Can be \code{"none"}, \code{"log"}, \code{"loglog"}, \code{"cloglog"}.
##' @param n.sim [integer, >0] the number of simulations used to compute the quantiles for the confidence bands.
##' @param seed [integer, >0] seed number set before performing simulations for the confidence bands.
##' If not given or NA no seed is set.
##' @param ... not used.
##'
##' @details The confidence bands and confidence intervals are automatically restricted to the interval [0;1].
##' 
##' @author Brice Ozenne
##'

## * confint.predictCSC (examples)
##' @examples
##' library(survival)
##' library(prodlim)
##' #### generate data ####
##' set.seed(10)
##' d <- sampleData(100) 
##' 
##' #### estimate a stratified CSC model ###
##' fit <- CSC(Hist(time,event)~ X1 + strata(X2) + X6, data=d)
##' 
##' #### compute individual specific risks
##' fit.pred <- predict(fit, newdata=d[1:3], times=c(3,8), cause = 1,
##'                     se = TRUE, iid = TRUE, band = TRUE)
##' fit.pred
##'
##' ## check confidence intervals
##' newse <- fit.pred$absRisk.se/(-fit.pred$absRisk*log(fit.pred$absRisk))
##' cbind(lower = as.double(exp(-exp(log(-log(fit.pred$absRisk)) + 1.96 * newse))),
##'       upper = as.double(exp(-exp(log(-log(fit.pred$absRisk)) - 1.96 * newse)))
##' )
##'
##' #### compute confidence intervals without transformation
##' confint(fit.pred, absRisk.transform = "none")
##' cbind(lower = as.double(fit.pred$absRisk - 1.96 * fit.pred$absRisk.se),
##'       upper = as.double(fit.pred$absRisk + 1.96 * fit.pred$absRisk.se)
##' )
##' 
##' 

## * confint.predictCSC (code)
##' @rdname confint.predictCSC
##' @method confint predictCSC
##' @export
confint.predictCSC <- function(object,
                               parm = NULL,
                               level = 0.95,
                               n.sim = 1e4,
                               absRisk.transform = "loglog",
                               seed = NA,
                               ...){

    if(object$se[[1]] == FALSE && object$band[[1]] == FALSE){
        message("No confidence interval/band computed \n",
                "Set argument \'se\' or argument \'band\' to TRUE when calling the predictCSC function \n")
        return(object)
    }

    ## ** check arguments
    dots <- list(...)
    if(length(dots)>0){
        txt <- names(dots)
        txt.s <- if(length(txt)>1){"s"}else{""}
        stop("unknown argument",txt.s,": \"",paste0(txt,collapse="\" \""),"\" \n")
    }

    object$absRisk.transform <- match.arg(absRisk.transform, c("none","log","loglog","cloglog"))

    if(object$band){
        if(is.null(object$absRisk.se)){
            stop("Cannot compute confidence bands \n",
                 "Set argument \'se\' to TRUE when calling the predictCSC function \n")
        }
        if(is.null(object$absRisk.iid)){
            stop("Cannot compute confidence bands \n",
                 "Set argument \'iid\' to TRUE when calling the predictCSC function \n")
        }
    }
    
    ## ** compute se, CI/CB
    outCIBP <- transformCIBP(estimate = object$absRisk,
                             se = object$absRisk.se,
                             iid = object$absRisk.iid,
                             null = NA,
                             conf.level = level,
                             n.sim = n.sim,
                             seed = seed,
                             type = object$absRisk.transform,
                             min.value = switch(object$absRisk.transform,
                                                "none" = 0,
                                                "log" = NULL,
                                                "loglog" = NULL,
                                                "cloglog" = NULL),
                             max.value = switch(object$absRisk.transform,
                                                "none" = 1,
                                                "log" = 1,
                                                "loglog" = NULL,
                                                "cloglog" = NULL),
                             ci = object$se,
                             band = object$band,
                             method.band = "maxT-simulation",
                             alternative = "two.sided",
                             p.value = FALSE)
    
    names(outCIBP) <- paste0("absRisk.", names(outCIBP))
    object[names(outCIBP)] <- outCIBP

    ## compute variance-covariance matrix
    if(!is.null(object[["absRisk.iid"]])){
        n.obs <- NROW(object[["absRisk"]])
        n.times <- NCOL(object[["absRisk"]])
        object$vcov <- lapply(1:n.obs, function(iObs){
            if(n.times==1){
                return(sum(object[["absRisk.iid"]][,,iObs]^2))
            }else{
                return(crossprod(object[["absRisk.iid"]][,,iObs]))
            }
        })
    }
    
    ## export
    object$conf.level <- level
    return(object)
}


######################################################################
### confint.predictCSC.R ends here
