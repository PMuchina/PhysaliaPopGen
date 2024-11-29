# TL - 2291124
setwd("/home/tleroy/Cours/2024-ongoing_Physalia/Practical_GEA/")
library(raster)
library(maps)

### script based on the following tutorial: https://www.benjaminbell.co.uk/2018/01/extracting-data-and-making-climate-maps.html
# populations to pot
places=read.table("GPScoordinates_data_to_plot_locations_map.txt",h=TRUE,sep="\t")

# Import WorldClim  data PLEASE HAVE A LOOK AT THE TUTORIAL TO KNOW WHERE TO DOWNLOAD THEM (NOT PROVIDED = EXTREMELY BIG FILES!!!)
elevation <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/elevation/wc2.1_30s_elev.tif")

temp1 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_01.tif")
temp2 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_02.tif")
temp3 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_03.tif")
temp4 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_04.tif")
temp5 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_05.tif")
temp6 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_06.tif")
temp7 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_07.tif")
temp8 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_08.tif")
temp9 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_09.tif")
temp10 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_10.tif")
temp11 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_11.tif")
temp12 <- raster("/home/tleroy/Collab/Ivalda/Map_CoteIvoire/avg_temp/wc2.1_30s_tavg_12.tif")

# Subset Ivory Coast elevation
ma.area <- extent(-12, 14, 40, 55)
ma.elevation <- crop(elevation, ma.area)

# map elevation
#pdf(file="bidon",width=10,height=10)
elevcol <- colorRampPalette(c("cornsilk", "saddlebrown"))
plot(ma.elevation,zlim=c(0,4200), col=elevcol(100))
map("world", add=TRUE, lwd=1.5) # Add country outlines
points(places$long,places$lat,pch=ifelse(substr(places$name2,1, 1)=="L",17,ifelse(substr(places$name2,1, 1)=="O",17,20)),cex=1.5,
       col=ifelse(substr(places$name2,1, 1)=="L","saddlebrown",ifelse(substr(places$name2,1, 1)=="O","saddlebrown","forestgreen")))
text(x=ifelse(substr(places$name2,1, 1)=="L",NA,ifelse(substr(places$name2,1, 1)=="O",NA,places$long-0.6)),y=ifelse(substr(places$name2,1, 1)=="L",NA,ifelse(substr(places$name2,1, 1)=="O",NA,places$lat)),col="forestgreen")
#dev.off()

# average temperature
ma.temp1 <- crop(temp1, ma.area)
ma.temp2 <- crop(temp2, ma.area)
ma.temp3 <- crop(temp3, ma.area)
ma.temp4 <- crop(temp4, ma.area)
ma.temp5 <- crop(temp5, ma.area)
ma.temp6 <- crop(temp6, ma.area)
ma.temp7 <- crop(temp7, ma.area)
ma.temp8 <- crop(temp8, ma.area)
ma.temp9 <- crop(temp9, ma.area)
ma.temp10 <- crop(temp10, ma.area)
ma.temp11 <- crop(temp11, ma.area)
ma.temp12 <- crop(temp12, ma.area)


tempcol <- colorRampPalette(c("purple", "blue", "skyblue", "green", "lightgreen", "yellow", "orange", "red", "darkred"))
plot(mean(ma.temp1,ma.temp2,ma.temp3,ma.temp4,ma.temp5,ma.temp6,ma.temp7,ma.temp8,ma.temp9,ma.temp10,ma.temp11,ma.temp12), zlim=c(-5,18), col=tempcol(100))
map("world", add=TRUE, lwd=1.5) # Add country outlines
points(places$long,places$lat,pch=ifelse(substr(places$name2,1, 1)=="L",17,ifelse(substr(places$name2,1, 1)=="O",17,20)),cex=1.5,
       col=ifelse(substr(places$name2,1, 1)=="L","saddlebrown",ifelse(substr(places$name2,1, 1)=="O","saddlebrown","forestgreen")))
text(x=ifelse(substr(places$name2,1, 1)=="L",NA,ifelse(substr(places$name2,1, 1)=="O",NA,places$long-0.6)),y=ifelse(substr(places$name2,1, 1)=="L",NA,ifelse(substr(places$name2,1, 1)=="O",NA,places$lat)),col="forestgreen")
