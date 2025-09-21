<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="center">

# Panel Data

![Img](https://github.com/user-attachments/assets/65207a8e-e7e9-4cea-aa88-bad29c1651b9)

<!-- BADGES -->
<img src="https://img.shields.io/github/license/HenrySchall/Artificial_Intelligence?style=flat&logo=opensourceinitiative&logoColor=white&color=0080ff" alt="license">
<img src="https://img.shields.io/github/last-commit/HenrySchall/Artificial_Intelligence?style=flat&logo=git&logoColor=white&color=0080ff" alt="last-commit">
<img src="https://img.shields.io/github/languages/top/HenrySchall/Artificial_Intelligence?style=flat&color=0080ff" alt="repo-top-language">
<img src="https://img.shields.io/github/languages/count/HenrySchall/Artificial_Intelligence?style=flat&color=0080ff" alt="repo-language-count">

<em>Built with the tools and technologies:</em>

<img src="https://img.shields.io/badge/Markdown-000000.svg?style=flat&logo=Markdown&logoColor=white" alt="Markdown">
<img src="https://img.shields.io/badge/Python-3776AB.svg?style=flat&logo=Python&logoColor=white" alt="Python">

</div>
<br>

---
## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Usage](#usage)
    - [Testing](#testing)
- [Features](#features)
- [Project Structure](#project-structure)
    - [Project Index](#project-index)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgment](#acknowledgment)

---
## Overview

> Panel data estimation is the analysis of data that have a two-factor structure, i.e., we have one factor that represents different units (such as individuals, companies, countries, etc.) and another that represents different time periods. This repository demonstrates the process of estimating the panel data model.

### General Characteristics
- Heterogeneity of units: Each unit (individual, company, country, etc.) may have its own characteristics that do not vary over time.
- Temporal variability: Variables may change over time for each unit.
- Longitudinal structure: The presence of multiple observations for each unit allows the analysis of both variability within and between units.

> We can say that Panel Data is subdivided into two types: True Panel and Cross-Section Clustering. When we have a True Panel, the same unit of analysis is used over time (all the "i"s are the same), that is, in a survey, for example, the data will be about the same individuals over time. In a Cross-Section Clustering, the "i"s will not be the same between periods, that is, in a survey the data will not be about the same individuals.

### Panel Data Models
1) Pooled Cross Section
2) Panel Data
   - Fixed Effects Model (FE)
   - Random Effects Model (RE)
   - Dynamic Effects Model (GMM)

### General Equation
$Yit = \beta0 + + \beta1Xit + \beta2Xit + eit$

- i = specific units
- t = time

### Repository Bibliographic References:
- Econometric Analysis of Cross Section and Panel Data, Second Edition, by Jeffrey M. Wooldridge

- https://www.youtube.com/watch?v=fv5HLjmtkGU
- https://core.ac.uk/download/pdf/6379375.pdf
