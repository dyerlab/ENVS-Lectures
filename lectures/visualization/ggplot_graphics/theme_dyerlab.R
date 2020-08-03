theme_dyerlab <- function (base_size = 12, base_family = "Helvetica"){
  
  update_geom_defaults("point", list(colour = "#D8D8D8"))
  update_geom_defaults("line", aes(color="#D8D8D8"))
  update_geom_defaults("bar", aes(fill="#D8D8D8"))
  
  theme(
    line = element_line(colour = "white", size = 0.5, linetype = 1, lineend = "butt"), 
    rect = element_rect(fill = "white", colour = "white", size = 0.5, linetype = 1), 
    text = element_text(family = base_family, face = "plain", colour = "black", size = base_size, hjust = 0.5,  vjust = 0.5, angle = 0, lineheight = 0.9), 
    
    axis.line = element_line(colour = "#D8D8D8", size = 0.5, linetype = 1, lineend = "butt"), 
    axis.text = element_text(size = rel(0.8),  colour = "#D8D8D8"), 
    axis.ticks = element_line(colour = "#D8D8D8"), 
    axis.title = element_text(colour="#D8D8D8"), 
    axis.title.x = element_text(), 
    axis.title.y = element_text(angle = 90, vjust = 0.5), 
    axis.ticks.length = grid::unit(0.3, "lines"), 
    axis.ticks.margin = grid::unit(0.5, "lines"), 
    
    legend.background = element_rect(colour = NA,fill="transparent"), 
    legend.key = element_rect(colour = '#D8D8D8', fill = NA, size = 0.0),
    #legend.key.size = grid::(1.2, "lines"), 
    #legend.key.height = NULL, 
    #legend.key.width = NULL,     
    legend.text = element_text(colour="#D8D8D8"), 
    legend.title = element_text(colour="#D8D8D8"), 
    legend.position = "right", 
    legend.text.align = NULL, 
    legend.title.align = NULL, 
    legend.direction = "vertical", 
    legend.box = NULL,    
    
    panel.background = element_rect(fill = "transparent", colour = NA), 
    panel.border = element_blank(), 
    panel.margin = grid:::unit(0.25, "lines"),     
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    
    strip.background = element_blank(), 
    strip.text = element_text(size = rel(0.8),  colour = "#D8D8D8"), 
    strip.text.x = element_text(), 
    strip.text.y = element_text(angle = -90), 
    
    plot.background = element_rect(colour = 'NA', fill = 'transparent'), 
    plot.title = element_text(size = rel(1.2)), 
    plot.margin = grid:::unit(c(1, 1, 0.5, 0.5), "lines"), 
    
    complete = TRUE)   # denotes that this is a complete theme function
  
}

