
# 30 day map challenge, day 16 minimal.
# code by juliagdealedo
# inspired by Georgios Karamanis in https://github.com/gkaramanis/30DayMapChallenge/blob/main/2022/16-minimal-world/16-minimal-world.R 

library(tidyverse)
library(sf)
library(camcorder)
library(giscoR)
library(rmapshaper)
library(smoothr)
library(ggrepel)
library(rnaturalearth)
library(showtext)
library(sysfonts)
library(ggspatial)

font_add_google("Rubik", "rub")
showtext_auto()

world_data <- ne_countries(scale = "medium", returnclass = "sf")
mcarthur <- " +proj=robin +datum=WGS84 +no_defs +axis=esu"
world <- world_data %>% st_transform(crs = mcarthur)  %>% rmapshaper::ms_simplify(keep = 0.001)  
ggplot(world)+
  geom_sf(fill = "black", color = "aliceblue")+
  coord_sf()+
  theme_void()+
  theme(panel.grid.major = element_line(), panel.background = element_rect(fill = "black"))+
  annotate(x = 140, y = -90, "text", label = "JGA | #30daymapchallenge", 
           size = 2, family="rub", hjust = 0, colour="aliceblue")+
  annotation_north_arrow(location = "tl", which_north = "true", 
                         pad_x = unit(0.25, "in"), pad_y = unit(0.85, "in"),
                         height = unit(1, "cm"),
                         width = unit(1, "cm"),
                         style = north_arrow_fancy_orienteering( text_col = 'white',
                         line_col = 'white', 
                         fill = 'white'), rotation=180) 

ggsave("challenge_fin.png")
