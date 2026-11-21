# External Shocks and Macroeconomic Adjustment in South Asia

## Project overview

This project studies the transmission of external shocks in a small open
economy, using Pakistan as the country case. It combines annual World
Development Indicators (WDI) data with simulations from a small open
economy RBC model implemented in Dynare.

The empirical analysis examines real GDP growth, gross capital
formation, the current account balance and foreign direct investment
(FDI) inflows. The theoretical analysis uses `soerbc_proj.mod` to
examine technology and risk-premium shocks, including alternative values
for the persistence of the risk-premium process.

The empirical and model results are compared qualitatively. The model's
impulse response functions (IRFs) show deviations of model variables
from their steady-state levels, whereas the WDI indicators are annual
growth rates or ratios to GDP. They are therefore not directly
comparable in units or magnitude.

## Repository structure

``` text

-- pakistan_data_analysis.ipynb
-- WDI_Data_Raw.csv
-- soerbc_proj.mod

``` 
## Data

### Source and indicators

The empirical analysis uses the World Bank's World Development
Indicators (WDI). The downloaded source file is retained as
`WDI_Data_Raw.csv` and is not overwritten by the notebook.

  ------------------------------------------------------------------------
  Indicator               WDI series code          Unit
  ----------------------- ------------------------ -----------------------
  GDP growth (annual %)   `NY.GDP.MKTP.KD.ZG`      Annual percentage
                                                   growth

  Gross capital formation `NE.GDI.TOTL.ZS`         Percentage of GDP
  (% of GDP)                                       

  Current account balance `BN.CAB.XOKA.GD.ZS`      Percentage of GDP
  (% of GDP)                                       

  Foreign direct          `BX.KLT.DINV.WD.GD.ZS`   Percentage of GDP
  investment, net inflows                          
  (% of GDP)                                       
  ------------------------------------------------------------------------

The analysis covers 2000--2025. The WDI data were downloaded on 21
November 2026. The WDI database metadata indicated a last update of 11
November 2026; this is distinct from the download date.

Annual WDI observations are retained with their published year labels.
The notebook does not impose an independent conversion between
calendar-year and Pakistan fiscal-year observations.

### Data preparation

All data preparation, transformations, calculations, tables and
empirical graphs are performed in
 `Pakistan_data_analysis.ipynb`. No separate transformed
CSV is required for the submitted workflow. The original WDI CSV remains
unchanged.

The notebook has been tested by running all cells from top to bottom on
a fresh kernel. Run it in sequence so that each data object is created
before it is used later in the analysis.

## Software and environment

The project was developed and run using the following software versions:

  Software / package   Version
  -------------------- -----------------------------------
  Operating system     Windows (development environment)
  Python               3.14.2
  pandas               2.3.3
  NumPy                2.5.1
  Matplotlib           3.11.1
  MATLAB               R2025b
  Dynare               7.2

The Python analysis uses a virtual environment (`.venv`) in the
development environment. The virtual environment itself is not required
to be submitted; the package versions above are provided so that the
environment can be recreated.

### Recreating the Python environment (Windows PowerShell)

From the repository root:

``` powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install pandas==2.3.3 numpy==2.5.1 matplotlib==3.11.1 jupyter ipykernel
```

Select this `.venv` as the Python kernel in VS Code or Jupyter.

### Running the empirical analysis

1.  Open the repository.
2.  Open `pakistan_data_analysis.ipynb`.
3.  Select the project `.venv` kernel.
4.  Restart the kernel and run all cells from top to bottom.

The notebook reads the raw WDI file from the `data_handling` directory.
If the notebook uses the relative filename `WDI_Data_Raw.csv`, set
`data_handling` as the notebook's working directory. No absolute paths
from the original development computer should be required.

The notebook produces the empirical calculations, tables and graphs used
in the analysis. The original raw data file should not be edited.

## Theoretical model and Dynare experiments

### Model file

The model specification is `soerbc_proj.mod`. It is a
Dynare model file and is run from MATLAB using Dynare.

The current submitted model specification has:

``` matlab
rho_rp = 0.95;
```

### Running the model

Requirements: - MATLAB R2025b - Dynare 7.2 installed and configured on
the MATLAB path

In MATLAB, set the Current Folder to `theoretical_model`, then run:

``` matlab
dynare soerbc_proj.mod
```

Dynare will execute the model using the parameter values in the `.mod`
file and generate its output files. The submitted log, numerical result
file and IRF figures are retained in `theoretical_model/results/` as
archived outputs.

### Risk-premium persistence experiments

Three experiments were conducted using the same `.mod` file. Only the
persistence parameter of the risk-premium process, `rho_rp`, was changed
between runs. The shock standard deviation and all other model
parameters were held fixed.

To reproduce an experiment:

1.  Open `soerbc_proj.mod`.
2.  Set `rho_rp` to the desired value in the table.
3.  Save the `.mod` file.
4.  Run `dynare soerbc_proj.mod` from MATLAB with `theoretical_model` as
    the Current Folder.


## Reproducibility notes

-   `WDI_Data_Raw.csv` is the original downloaded WDI file and is
    retained unchanged.
-   All empirical data processing and analysis are contained in the
    Jupyter notebook.
-   The notebook has been tested from a fresh kernel, running all cells
    from top to bottom.
-   The Dynare model source is included as `soerbc_proj.mod`.
-   The saved Dynare log and `.mat` file correspond to the current 0.95
    persistence specification.
-   IRF figures for all three persistence values are included in
    separate folders.
-   The alternative persistence experiments are reproduced by changing
    only `rho_rp`, while holding the remaining calibration and shock
    standard deviations fixed.
-   File references are relative to the repository structure; no
    personal computer paths are required.

## Interpretation and limitations

The model's IRFs represent deviations of model variables from their
steady-state levels. The empirical indicators are annual GDP growth and
GDP ratios. The comparison is therefore qualitative and focuses on the
broad direction and timing of adjustment, not equality of units or
magnitudes.

Demeaning the empirical indicators could centre them around their sample
averages and make plots appear more comparable to the IRFs. However, it
would not make them equivalent to deviations from the model's steady
state. For example, demeaned GDP growth would measure growth relative to
the sample's average GDP growth rate, rather than deviations in the
level of output. The empirical analysis therefore retains the original
WDI observations for the main comparison.

The risk-premium experiment illustrates one possible transmission
mechanism. It does not establish that a risk-premium shock caused
Pakistan's historical macroeconomic episode.

## Data source

World Bank, World Development Indicators:
https://databank.worldbank.org/source/world-development-indicators
