library(Hmisc)

core_all = read.csv("../data/static_core_all.txt")
perf_28 = read.csv("../data/static_sleep_28_2048_28.txt")

# Convert FLOPS to GFLOPS
core_all$flops = core_all$flops /1000000000
perf_28$flops = perf_28$flops/1000000000

# Adjust the serial execution time
# core_all$flops[core_all$cores == "1"]<-2.0

# Aggregate the cores and mean flops
core_flops_ag = aggregate(flops~cores, core_all, mean)

# Add the speedup
core_flops_ag$speedup = core_flops_ag$flops/core_flops_ag$flops[2]

# Add the serial portion
core_flops_ag$serial = (core_flops_ag$speedup - core_flops_ag$cores)/(1 - core_flops_ag$cores)

# Add the efficiency 
# core_flops_ag$efficiency = (((1/core_flops_ag$speedup)-(core_flops_ag$cores))\(1 - (1/core_flops_ag$cores)))
core_flops_ag$efficiency = (((1/core_flops_ag$speedup)-(1/core_flops_ag$cores))/(1 - (1/core_flops_ag$cores)))

core_flops_format = format.df(core_flops_ag, digits=3)
core_flops_format = core_flops_format[,-1]


# Create box plots for the core_all flops
# pdf("core_all.pdf", width=7, height=5)
# boxplot(flops~cores, core_all, main="Cores vs FLOPS (10 iterations)", xlab="Cores", 
# 	ylab="Giga FLOPS", col="light blue")
# dev.off()

# Save the summary of the perf_28 flops data
# latex(summary(perf_28$flops), title="28 Cores, 100 iterations")

# latex(core_flops_format)


