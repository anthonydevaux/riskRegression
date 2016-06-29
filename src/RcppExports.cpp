// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// BaseHazStrata_cpp
List BaseHazStrata_cpp(const NumericVector& alltimes, const IntegerVector& status, const NumericVector& Xb, const IntegerVector& strata, int nPatients, int nStrata, double maxtime, int cause, bool Efron);
RcppExport SEXP riskRegression_BaseHazStrata_cpp(SEXP alltimesSEXP, SEXP statusSEXP, SEXP XbSEXP, SEXP strataSEXP, SEXP nPatientsSEXP, SEXP nStrataSEXP, SEXP maxtimeSEXP, SEXP causeSEXP, SEXP EfronSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< const NumericVector& >::type alltimes(alltimesSEXP);
    Rcpp::traits::input_parameter< const IntegerVector& >::type status(statusSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type Xb(XbSEXP);
    Rcpp::traits::input_parameter< const IntegerVector& >::type strata(strataSEXP);
    Rcpp::traits::input_parameter< int >::type nPatients(nPatientsSEXP);
    Rcpp::traits::input_parameter< int >::type nStrata(nStrataSEXP);
    Rcpp::traits::input_parameter< double >::type maxtime(maxtimeSEXP);
    Rcpp::traits::input_parameter< int >::type cause(causeSEXP);
    Rcpp::traits::input_parameter< bool >::type Efron(EfronSEXP);
    __result = Rcpp::wrap(BaseHazStrata_cpp(alltimes, status, Xb, strata, nPatients, nStrata, maxtime, cause, Efron));
    return __result;
END_RCPP
}
// baseHazEfron_survival_cpp
NumericVector baseHazEfron_survival_cpp(int ntimes, IntegerVector ndead, NumericVector risk, NumericVector riskDead);
RcppExport SEXP riskRegression_baseHazEfron_survival_cpp(SEXP ntimesSEXP, SEXP ndeadSEXP, SEXP riskSEXP, SEXP riskDeadSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< int >::type ntimes(ntimesSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type ndead(ndeadSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type risk(riskSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type riskDead(riskDeadSEXP);
    __result = Rcpp::wrap(baseHazEfron_survival_cpp(ntimes, ndead, risk, riskDead));
    return __result;
END_RCPP
}
// colCumSum
NumericMatrix colCumSum(NumericMatrix x);
RcppExport SEXP riskRegression_colCumSum(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    __result = Rcpp::wrap(colCumSum(x));
    return __result;
END_RCPP
}
// colSumsCrossprod
NumericMatrix colSumsCrossprod(NumericMatrix X, NumericMatrix Y, bool transposeY);
RcppExport SEXP riskRegression_colSumsCrossprod(SEXP XSEXP, SEXP YSEXP, SEXP transposeYSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type X(XSEXP);
    Rcpp::traits::input_parameter< NumericMatrix >::type Y(YSEXP);
    Rcpp::traits::input_parameter< bool >::type transposeY(transposeYSEXP);
    __result = Rcpp::wrap(colSumsCrossprod(X, Y, transposeY));
    return __result;
END_RCPP
}
// rowCumSum
NumericMatrix rowCumSum(NumericMatrix x);
RcppExport SEXP riskRegression_rowCumSum(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    __result = Rcpp::wrap(rowCumSum(x));
    return __result;
END_RCPP
}
// rowSumsCrossprod
NumericMatrix rowSumsCrossprod(NumericMatrix X, NumericMatrix Y, bool transposeY);
RcppExport SEXP riskRegression_rowSumsCrossprod(SEXP XSEXP, SEXP YSEXP, SEXP transposeYSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type X(XSEXP);
    Rcpp::traits::input_parameter< NumericMatrix >::type Y(YSEXP);
    Rcpp::traits::input_parameter< bool >::type transposeY(transposeYSEXP);
    __result = Rcpp::wrap(rowSumsCrossprod(X, Y, transposeY));
    return __result;
END_RCPP
}