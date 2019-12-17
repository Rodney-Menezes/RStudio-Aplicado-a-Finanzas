
# Taller: Rstudio Aplicado a Finanzas
# Colegio de Economistas de Loreto
# Profesor: Jose Rodney Menezes De la Cruz

#========================================================================
# Sesión 3 "Graficacion con Rstudio"
#========================================================================

#=================================================
# I. Manipulación de Datos 
#=================================================

inputs <- "D:/Biblioteca/Talleres Dictados/R - Studio Aplicado a Finanzas/Sesion 3/Inputs/Bases de Datos"

install.packages('readxl')
install.packages("dplyr")
library(readxl)
library(dplyr)

file.choose()

ruta_excel <- "D:\\Biblioteca\\Talleres Dictados\\R - Studio Aplicado a Finanzas\\Sesion 3\\Inputs\\Bases de Datos\\base_pnud.xlsx"

base_pnud <- read_excel(ruta_excel)
summary(base_pnud)

# 1 Filtros y Ordenamientos ------------------------------------------------------------------

# Filtro
lima <- base_pnud %>%
  filter(departamento == "Lima")

# Ordenar observaciones (ascender)
asc <- base_pnud %>%
  arrange(esp_vida)

# Ordenar observaciones (descender)
des <- base_pnud %>%
  arrange(desc(esp_vida))

# Filtrar y ordenar
lima_asc <- base_pnud %>%
  filter(departamento=="Lima") %>%
  arrange(poblacion)

# 2. Agrupar y Resumen Estadístico ----------------------------------------------------

# summarize (Resúmen Estadístico)
base_pnud %>%
  filter(departamento=="Cusco") %>%
  summarize(med_ingreso = median(ing_fam_pc),
            max_logro   = max(logro_educat))

# group_by (Agrupamiento)
by_departamento <- base_pnud %>%
  group_by(departamento) %>%
  summarize(med_ingreso = median(ing_fam_pc),
            max_logro   = max(logro_educat))


#=================================================
# II. Visualización de Datos 
#=================================================

install.packages("ggplot2")
library(ggplot2)

# Filtro
lima_callao <- base_pnud %>%
  filter(departamento == "Lima" | departamento=="Callao") %>%
  mutate(poblacion = poblacion/1000)

# 1  Scatter plot -------------------------------------------------------------------------
ggplot(lima_callao, 
       aes(x=poblacion, y=ing_fam_pc)) +
  geom_point()

# Cambiar el gráfico a escalas logaritmicas
ggplot(lima_callao, 
       aes(x = poblacion, y = ing_fam_pc)) +
  geom_point() + scale_x_log10() + scale_y_log10()

# Burbujas
ggplot(lima_callao, 
       aes(x = poblacion, y=ing_fam_pc, color=departamento, size=poblacion)) + 
  geom_point() + scale_x_log10() + scale_y_log10()

# Subgraficos
ggplot(base_pnud, 
       aes(x = poblacion, y=ing_fam_pc)) + 
  geom_point() + scale_x_log10() + scale_y_log10() +
  facet_wrap(~ departamento)


# 2 Gráfico de Lineas ------------------------------------------------------------
library(readxl)

file.choose()

ruta_excel2 <- "D:\\Biblioteca\\Talleres Dictados\\R - Studio Aplicado a Finanzas\\Sesion 3\\Inputs\\Bases de Datos\\PBI.xlsx"
  
pbi_peru <- read_excel(ruta_excel2)

summary(pbi_peru)

ggplot(pbi_peru, 
       aes(x=year, y=PBI)) +
  geom_line() +
  expand_limits(y=0)


# 3 Gráficos de Barras ------------------------------------------------------------

install.packages('gapminder')
library(gapminder)

# Ejemplo 1: 
by_continent <- gapminder %>%
  filter(year==2007) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Creando un gráfico de barra mostrando medianGdp por continent
ggplot(by_continent, 
       aes(x=continent, y=medianGdpPercap)) +
  geom_col()


# Ejemplo 2:
by_departamento <- base_pnud %>%
  group_by(departamento) %>%
  summarize(med_ingreso = median(ing_fam_pc),
            max_logro   = max(logro_educat))

# Creando un bar plot de gdpPercap por país
ggplot(by_departamento, 
       aes(x=departamento, y=med_ingreso)) +
  geom_col()


# 4 Histogramas ------------------------------------------------------------
gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Creando un histograma de poblacion
ggplot(gapminder_1952, 
       aes(x=pop)) +
  geom_histogram()

#======================================================================================#

############################ Fin sesion 3 ####################################

#======================================================================================#