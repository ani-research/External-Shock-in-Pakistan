# External Shocks and Macroeconomic Adjustment in South Asia

## Project Overview

This project investigates the transmission of external shocks and the process of macroeconomic adjustment in a small open economy, using **Pakistan as a country case study**.

The study examines Pakistan's macroeconomic developments during 2021–2024, a period characterised by external financing pressures, macroeconomic instability, declining investment and subsequent external adjustment.

The project combines two approaches:

1. **Empirical analysis:** Examination of Pakistan's macroeconomic indicators using annual data from the World Bank's World Development Indicators (WDI).
2. **Computational macroeconomic analysis:** Simulation of a Small Open Economy Real Business Cycle (RBC) model using Dynare, with Python-based verification using gEconpy.

The central objective is to understand how external financing shocks, particularly increases in the risk premium on foreign borrowing, can influence domestic economic activity, investment, consumption and the current account.

---

## Research Question

**How can a positive external risk-premium shock generate macroeconomic adjustment in a small open economy, and to what extent do the model's predictions correspond to Pakistan's experience during 2021–2024?**

The analysis focuses on the transmission mechanism through which higher external borrowing costs affect domestic expenditure, investment decisions and external balances.

## 1. Empirical Analysis: Pakistan (2000–2025)

The empirical component examines four macroeconomic indicators obtained from the World Bank's World Development Indicators database.

| Indicator | WDI Series Code | Measurement |
|---|---|---|
| GDP Growth | `NY.GDP.MKTP.KD.ZG` | Annual percentage growth |
| Gross Capital Formation | `NE.GDI.TOTL.ZS` | Percentage of GDP |
| Current Account Balance | `BN.CAB.XOKA.GD.ZS` | Percentage of GDP |
| Foreign Direct Investment | `BX.KLT.DINV.WD.GD.ZS` | Percentage of GDP |

**Data coverage:** 2000–2025 (26 annual observations).

The dataset was downloaded on 21 November 2026, with the WDI database recording an update date of 11 November 2026.

The empirical analysis examines Pakistan's macroeconomic trajectory across six broad phases:

- 2000–2006: Economic expansion and increased external assistance.
- 2007–2013: Economic slowdown and external instability.
- 2014–2018: Investment-led recovery and CPEC.
- 2019–2020: IMF stabilisation and COVID-19.
- 2021–2024: External financing pressures and macroeconomic adjustment.
- 2025: Subsequent stabilisation and external balance developments.

### Data Processing and Visualisation

Python is used for:
- Extracting and restructuring WDI time-series observations.
- Cleaning and converting observations into numerical formats.
- Examining macroeconomic trends over time.
- Constructing comparative visualisations of the four indicators.
- Highlighting the 2021–2024 external adjustment episode.

The original WDI dataset is retained unchanged.

## 2. Theoretical Framework: Small Open Economy RBC Model

The theoretical component employs a Small Open Economy RBC model with a debt-elastic country risk premium.

The model examines how an economy responds to two types of exogenous shocks:

**Technology shock**

A positive technology shock increases productivity, raising output, wages and returns to capital. This encourages consumption and investment, supporting capital accumulation and economic activity.

**Risk-premium shock**

A positive risk-premium shock raises the cost of external borrowing. Higher financing costs discourage domestic consumption and investment, reduce aggregate demand and generate an adjustment in the external balance.

The debt-elastic country premium introduces a stabilising mechanism: higher external indebtedness increases borrowing costs, encouraging external adjustment and net foreign asset accumulation.

### Model Calibration

| Parameter | Description | Value |
|---|---|---:|
| α | Capital share in production | 0.35 |
| β | Discount factor | 0.97 |
| δ | Depreciation rate | 0.06 |
| γ | Labour preference parameter | 0.20 |
| ρᵣ | Technology shock persistence | 0.95 |
| ρᵣₚ | Risk-premium shock persistence | 0.80 |
| φᵦ | Risk-premium coefficient | 0.01 |
| b̄ | Steady-state net foreign asset target | 0 |
| r* | World real interest rate | 0.0309 |

## 3. Computational Experiments

Impulse Response Functions (IRFs) are generated to examine the dynamic responses of the model economy to positive technology and risk-premium shocks.

The analysis considers three alternative values of risk-premium persistence:

| Experiment | Risk-premium persistence | Interpretation |
|---|---:|---|
| Low persistence | 0.40 | Short-lived external financing shock |
| Baseline | 0.80 | Intermediate persistence |
| High persistence | 0.95 | Highly persistent external financing shock |

The standard deviation of the exogenous shocks is held constant while varying the persistence of the risk-premium process.

The experiments examine the responses of:
- Output
- Consumption
- Investment
- Capital stock
- Hours worked
- Net foreign assets
- Current account
- Trade balance
- Borrowing rate
- Risk premium

### Main Computational Findings

The simulations illustrate that:

1. Higher external borrowing costs generate an initial contraction in domestic investment and output.
2. The economy responds by reducing external borrowing and accumulating net foreign assets.
3. The current account initially improves as domestic expenditure and investment decline.
4. Greater risk-premium persistence prolongs the contraction and delays the recovery of investment and output.
5. Consumption exhibits a relatively smoother adjustment due to consumption smoothing and subsequent interest income from accumulated foreign assets.

The results demonstrate how the persistence of external financing shocks influences both the magnitude and duration of macroeconomic adjustment.

## 4. Computational Verification: Dynare and Python

To verify the computational results, the model is independently simulated in Python using the **gEconpy** package.

The verification involves comparing:

- Impulse Response Functions generated by Dynare and Python.
- Steady-state values across both implementations.
- Policy and transition functions.
- Independently calculated numerical steady states.

The comparison shows close agreement between the Dynare and Python solutions.

Additionally, the model's steady-state values are substituted into the structural equations to calculate residuals. These residuals are approximately zero, supporting the numerical consistency of the steady-state solution.

## 5. Empirical and Model Comparison

The final stage compares the model's predictions with Pakistan's observed macroeconomic developments during 2021–2024.

The analysis focuses on three broad outcomes:

**Output:** Pakistan's GDP growth declined from 6.51% in 2021 to -0.41% in 2023, before recovering to 3.08% in 2024.

**Investment:** Gross capital formation initially increased from 14.53% of GDP in 2021 to 15.56% in 2022, before declining to 13.97% in 2023 and 13.20% in 2024.

**External balance:** The current account deficit narrowed from 3.52% of GDP in 2021 to 0.31% in 2023, followed by a small surplus of 0.12% in 2024.

These developments display broad similarities with the model's contractionary output and investment responses and its initial improvement in the external balance.

However, the timing of investment adjustment differs between the model and observed data.

The comparison is therefore qualitative rather than a direct numerical equivalence. Model variables are expressed in levels or deviations from steady state, whereas the empirical indicators are growth rates and ratios to GDP.

## 6. Limitations

The model provides a simplified representation of Pakistan's external adjustment and does not explicitly incorporate several important mechanisms.

The main limitations include:

- **Fiscal policy:** Government expenditure, taxation and public investment can independently influence domestic demand and output.
- **Supply-side disruptions:** Climate-related shocks, particularly the 2022 floods, affected productive capacity and household incomes.
- **Multiple external and domestic shocks:** Political instability, international commodity prices and other macroeconomic developments also influenced Pakistan's adjustment.
- **Model identification:** A simulated positive risk-premium shock does not establish that it caused Pakistan's historical economic difficulties.

The results should therefore be interpreted as demonstrating the plausibility of the risk-premium transmission mechanism rather than quantitatively identifying its contribution to Pakistan's historical adjustment.

---

## Repository Structure

```text
External-Shocks-and-Macroeconomic-Adjustment-in-South-Asia/
│
├── README.md
│
├── Report/
│   └── Report.docx
│
├── Data/
│   ├── README.md
│   │
│   └── data_handling/
│       ├── pakistan_data_analysis.ipynb
│       └── WDI_Data_Raw.csv
│
└── theoretical_model/
    ├── soerbc_proj.mod
    │
    └── results/
        ├── soerbc_proj.log
        ├── soerbc_proj_results.mat
        │
        └── IRF_Graphs/
            ├── rho_0.40/
            ├── rho_0.80/
            └── rho_0.95/
```

The `IRF_Graphs` directory contains the saved impulse-response figures for the three risk-premium persistence experiments.

## Technology Stack

| Software / Package | Application |
|---|---|
| Python 3.14.2 | Data processing and computational analysis |
| Pandas 2.3.3 | Data manipulation |
| NumPy 2.5.1 | Numerical computation |
| Matplotlib 3.11.1 | Data visualisation |
| gEconpy 2.4.0 | Independent Python implementation of the RBC model |
| MATLAB R2025b | Computational environment |
| Dynare 7.2 | DSGE/RBC model solution and simulation |

## Reproducing the Analysis

### A. Empirical Analysis

**Requirements:** Python and the packages listed above.

Clone the repository:

```bash
git clone https://github.com/ani-research/External-Shocks-and-Macroeconomic-Adjustment-in-South-Asia.git

cd External-Shocks-and-Macroeconomic-Adjustment-in-South-Asia
```

Create a virtual environment:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

Install the principal Python dependencies:

```bash
python -m pip install pandas==2.3.3 numpy==2.5.1 matplotlib==3.11.1 jupyter ipykernel
```

Open the notebook:

```text
Data/data_handling/pakistan_data_analysis.ipynb
```

Select the project virtual environment as the Jupyter kernel and execute the notebook sequentially, starting with a fresh kernel.

The notebook reads the original WDI dataset from the same directory.

### B. Theoretical Model

**Requirements:**
- MATLAB R2025b
- Dynare 7.2

Open MATLAB and set the Current Folder to `theoretical_model`.

Execute:

```matlab
dynare soerbc_proj.mod
```

To reproduce the alternative persistence experiments, change the parameter `rho_rp` in the `.mod` file to:

```matlab
rho_rp = 0.40;
```

```matlab
rho_rp = 0.80;
```

```matlab
rho_rp = 0.95;
```

Keep the remaining model parameters and shock standard deviations unchanged.

The submitted model file is configured with `rho_rp = 0.95`. The saved `.log` and `.mat` files correspond to this specification, while the IRF figures for all three experiments are archived separately.

---

## Data Source

[World Bank – World Development Indicators](https://databank.worldbank.org/source/world-development-indicators)

## References

- International Monetary Fund (2005). *Pakistan: Staff Report for the 2005 Article IV Consultation.*
- International Monetary Fund (2012). *Proposal for Post-Program Monitoring with Pakistan.*
- International Monetary Fund (2017). *Executive Board Concludes Article IV Consultation with Pakistan.*
- World Bank (2023). *Pakistan Development Update.*
- World Bank (2023). *Sustainable Growth in Pakistan.*

---

**Research Area:** Computational Macroeconomics | International Macroeconomics | Open Economy RBC Models | External Adjustment | DSGE Modelling

**Author:** Anirudh Khosla

**Programme:** MA Economics, South Asian University
