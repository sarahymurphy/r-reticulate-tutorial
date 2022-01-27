# WRF Land Surface Model Analysis

## Land surface model used in idealized simulations

5-Layer thermal diffusion model

Some notes about the Dudhia 1996:
* Goal was to improve the ground temperature over it's predecessor
* Five layers are used as implemented, but can be modified to use more layers
    * Layer thicknesses are as follows, from top to bottom:
        1. 1 cm
        2. 2 cm
        3. 4 cm
        4. 8 cm
        5. 16 cm
        * Below bottom layer, one 32 cm thick layer
* Heat transfer equations:
    * Heat flux ($F, W m^{-2}$) is lienarly proportional to temperature gradient:
        * $F = -K \rho_{s} c_{s} \frac{\partial T_{s}}{\partial z}$ (equation 1)
            * $K$: thermal diffusitivity of the soil ($m^{2}s^{-1}$)
                * Generally fixed at a value between clay and sand values
            * $\rho_{s}$: density of the soil ($kg m^{-3}$)
            * $c_{s}$: specific heat capacity ($J kg^{-2} K^{-1}$)
        * $\frac{\partial T_{s}}{\partial t} = - \frac{1}{\rho_{s}c_{s}} \frac{\partial F}{\partial z}$ (equation 2)
    * How are these equations used?
        1. Equation 1 calculates $F(z)$
        2. Equation 2, assuming $F(z = 0)$ is known and is **the net sensible, latent, and radiative flux**
            
## Land surface model used in real simulations

Noah Land Surface Model

