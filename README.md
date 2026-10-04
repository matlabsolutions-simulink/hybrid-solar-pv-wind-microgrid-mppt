# Hybrid Solar PV & Wind Microgrid with Incremental Conductance MPPT & Battery Storage

[![MATLAB](https://img.shields.io/badge/MATLAB-R2023b%20%7C%20R2024b-0076A8?logo=mathworks&logoColor=white)](https://www.mathworks.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Domain](https://img.shields.io/badge/Domain-Renewable%20Power%20Systems%20&%20Smart%20Grids-lightgrey.svg)](#)

A standalone MATLAB implementation of Hybrid Solar PV. Includes the governing dynamics, analytical formulations, and an executable script you can run directly without proprietary third-party dependencies.

## Overview

This repository provides a 24-hour dispatch simulation of a hybrid renewable microgrid. It includes a 100 kW solar PV array with Incremental Conductance MPPT, a 50 kW PMSG wind turbine, and a 300 kWh battery storage buffer to balance industrial load demand.

## Governing Equations & Mathematical Formulation

### Incremental Conductance MPPT Criteria

$$
\frac{dI}{dV} + \frac{I}{V} = 0 \implies \text{At Maximum Power Point (MPP)}
$$

$$
\frac{dI}{dV} + \frac{I}{V} > 0 \implies \text{Left of MPP (Increase Voltage)}
$$

$$
\frac{dI}{dV} + \frac{I}{V} < 0 \implies \text{Right of MPP (Decrease Voltage)}
$$

### Microgrid Power Balance Equation

$$
P_{\text{PV}}(t) + P_{\text{Wind}}(t) \pm P_{\text{Battery}}(t) = P_{\text{Load}}(t) + P_{\text{Loss}}(t)
$$

## Getting Started

### Prerequisites
- MATLAB (tested on R2022b through R2024b)
- Standard base MATLAB installation (no paid external toolboxes required for this starter script)

### Running the Code
1. Clone the repository:
   ```bash
   git clone https://github.com/matlabsolutions-simulink/hybrid-solar-pv-wind-microgrid-mppt.git
   cd hybrid-solar-pv-wind-microgrid-mppt
   ```
2. Open MATLAB, navigate to the cloned folder, and run:
   ```matlab
   run_hybrid_microgrid_simulation
   ```

## Need the Complete Simulink or Simscape Model?

If you are working on a university capstone, thesis, or lab assignment and need the complete `.slx` model with Simscape physical networks, custom parameter lookup tables, or automated test harnesses, our team at [MATLABSolutions.com](https://www.matlabsolutions.com/order-now.php?ref=github_hybrid_solar_pv_wind_microgrid_mppt) provides custom academic simulation and consulting support.

## Technical Inquiries & Contact
- Website: [matlabsolutions.com](https://www.matlabsolutions.com)
- Custom Consulting Portal: [matlabsolutions.com/order-now.php](https://www.matlabsolutions.com/order-now.php)
- Email: info@matlabsolutions.com

## License
This project is open-source under the [MIT License](LICENSE).
