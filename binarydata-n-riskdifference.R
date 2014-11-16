if(!require(epiR)) {install.packages('epiR'); library(epiR)}

exposed = c(rep(0, 990), rep(1, 10)) # 10 out of 1000 got seak
unexposed = c(rep(0, 980), rep(1, 20)) # 20 out of 1000 got seak

absExposedRisk = sum(exposed == 1) / length(exposed) # treatment group
absUnexposedRis = sum(unexposed == 1) / sum(unexposed == 0) # control group
# (Absolute) Risk Difference or Difference In Proportions or Attribute Risk
absRiskDiff = absUnexposedRis - absExposedRisk
# Absolute Risk Reduction
arr = absRiskDiff * 100
# Number Needed to Treat
nnt = 1 / absRiskDiff
# Relative Risk Difference or Ratio Proportions or Risk Ratio or Incidence Rate Ratio
relRiskDiff = absExposedRisk / absUnexposedRis
# Relative Risk Reduction
rrr = absRiskDiff/absUnexposedRis

exposedToUnexposedOddsRatio = absExposedRisk / (1-absExposedRisk) / absUnexposedRis / (1 - absUnexposedRis)
# the numbers are not exactly equal because of the precision issues.
exposedToUnexposedOddsRatio == sum(exposed == 1) * sum(unexposed == 0) / (sum(exposed == 0) * sum(unexposed == 1))
unexposedToExposedOddsRatio = 1/exposedToUnexposedOddsRatio

data = matrix(c(sum(exposed == 1), sum(exposed == 0),
                sum(unexposed == 1), sum(unexposed == 0)),
              nrow = 2, byrow = TRUE)
epi.2by2(data)
