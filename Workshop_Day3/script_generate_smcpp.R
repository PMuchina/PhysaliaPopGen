library(ggplot2)

setwd("~/Day3_demography/data-datepalm/Res_SMCpp")
inferredNe500=read.csv("physalia_smcpp_plot_missingcutoff500.csv",header=TRUE,sep=",")

colnames(inferredNe500)<-c("Population","Years","Ne","plot-type","plot-num")

My_colors <- c("PdactyliferaME"="chocolate4","PdactyliferaNAfr"="goldenrod1","Ptheophrasti"="navyblue")


pdf(file="Rplot_ggplot2_smcpp_missingcutoff500.pdf",width=10,height=10)
ggplot(inferredNe500, aes(x=Years, y=Ne)) + 
  geom_line(aes(colour=Population),size=3)+
  scale_colour_manual("Pop/species",values=My_colors)+
  xlab("Years ago")+ ylab(expression(paste("Effective population sizes (",italic(N[e]),")")))+
  scale_x_log10(limits=c(100,5000000),breaks = scales::trans_breaks("log10", function(x) 10^x),labels = scales::trans_format("log10", scales::math_format(10^.x)))+
  scale_y_log10(limits=c(100,5000000),breaks = scales::trans_breaks("log10", function(x) 10^x),labels = scales::trans_format("log10", scales::math_format(10^.x)))+
  theme_bw()+
  theme(plot.margin = margin(1,3,1.5,1.2, "cm"))+
  theme(legend.position=c(0.8, 0.8),panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.line = element_line(colour = 'black', size = 1.75), axis.ticks = element_line(colour = 'black', size = 1.75), 
        axis.text.x = element_text(colour="black",size=24,angle=0,hjust=.5,vjust=.5,face="plain"),
        axis.text.y = element_text(colour="black",size=24,angle=0,hjust=.5,vjust=.5,face="plain"),  
        axis.title.x = element_text(colour="black",size=28,angle=0,hjust=.5,vjust=.2,face="italic"),
        axis.title.y = element_text(colour="black",size=28,angle=90,hjust=.5,vjust=.5,face="italic"))
dev.off()
