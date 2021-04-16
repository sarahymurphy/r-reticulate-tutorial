#install.packages('reticulate')

library(reticulate)

# Install the python libraries you want to your r-reticulate python environment
# you only need to do this section once

#conda_install("r-reticulate", "cartopy", forge = TRUE)
#conda_install("r-reticulate", "matplotlib")
#conda_install("r-reticulate", xarray")

# Importing the python libraries
plt <- import('matplotlib.pyplot')
ccrs <- import('cartopy.crs')
xr <- import('xarray')
feature <- import('cartopy.feature')

# Opening a tutorial netcdf dataset using xarray
air_temperature <- xr$tutorial$open_dataset("air_temperature.nc")

# Creating the figure
fig <- plt$figure(figsize = c(15, 5))

# Defining the axes projection
ax <- plt$axes(projection = ccrs$PlateCarree())

# Setting the latitude and longitude bounaries
ax$set_extent(c(-125, -66.5, 20, 50))

# Adding coastliens
ax$coastlines()

# Adding state boundaries
ax$add_feature(feature$STATES)

# Drawing the latitude and longitude
ax$gridlines(draw_labels = TRUE)

# Plotting air temperature
plot <- air_temperature$air$sel(time='2013-04-14 00:00:00', 
                                method = 'nearest')$plot(ax = ax, transform = ccrs$PlateCarree())

# Giving our figure a title
ax$set_title('Air Temperature\n14 April 2013')

# Displaying the figure
plt$show()

# Importing a python script
#source_python('Python_PlotAirTemp.py')

#PlotAirTemp('2013-04-14 00:00:00')

