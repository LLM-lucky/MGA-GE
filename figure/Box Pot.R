########################################## Box Plot ###############################

df2 <- read.csv("微生物比例.csv", header = TRUE, sep = ",", row.names = 1)

p2 <- ggplot(df2,aes(x=Group,y=Microbial_DNA,fill=Group)) +
  stat_boxplot(geom="errorbar",width=0.2,size=0.5,position=position_dodge(0.6),color="black") +
  geom_boxplot(notch = F,size = 0.5,outlier.shape = NA,) +
  scale_fill_manual(values = c("#d0747f","#79a3cd"),limits = c("C","D")) +
  geom_jitter(aes(x=Group,y=Microbial_DNA,fill=Group),width=0.25,shape=21,size=1) +
  theme_test() +
  theme(
    axis.text.x=element_text(colour="black",size=12,vjust=1,hjust=1.2,angle=45),
    axis.text.y=element_text(colour="black",size=12),
    axis.title.x=element_text(size=12),
    axis.title.y=element_text(size=12),
    panel.grid.major=element_blank(),
    panel.grid.minor=element_blank()
  ) +
  ylab("Microbial DNA (%)")+xlab("")

p2
