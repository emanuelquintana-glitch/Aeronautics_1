# *Spacecraft Dynamics and Control: Mathematical Foundations and Applications*

[![Educational Material](https://img.shields.io/badge/-Educational%20Material-important)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Based on: Canuto et al.](https://img.shields.io/badge/-Based%20on%3A%20Canuto%20et%20al.-blue)](https://www.elsevier.com/books/spacecraft-dynamics-and-control/canuto/978-0-08-100700-5)
[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Quarto](https://img.shields.io/badge/Made%20with-Quarto-1a73e8.svg)](https://quarto.org/)
[![UPTC Student](https://img.shields.io/badge/-UPTC%20Student-005baa.svg)](https://www.uptc.edu.co/)
[![School of Engineering](https://img.shields.io/badge/-School%20of%20Engineering-cc0000.svg)]()

## Abstract

This repository presents a comprehensive treatment of spacecraft dynamics and control, implementing the Embedded Model Control (EMC) approach as developed by Canuto et al. The work provides rigorous mathematical foundations, detailed derivations, and practical implementations for attitude determination and control systems (ADCS), orbital mechanics, and guidance, navigation, and control (GNC) subsystems.

**Keywords:** Spacecraft Dynamics, Attitude Control, Embedded Model Control, Quaternion Kinematics, Orbital Mechanics, ADCS, GNC Systems

---

## Author Information

**Emanuel Quintana Silva**  
*Universidad Pedagógica y Tecnológica de Colombia (UPTC)*  
School of Engineering  
Sogamoso, Boyacá, Colombia  

Contact: [emanuel.quintana@uptc.edu.co](mailto:emanuel.quintana@uptc.edu.co)  
ORCID: [0000-0000-0000-0000](https://orcid.org/)  
ResearchGate: [Profile](https://www.researchgate.net/)

---

## Table of Contents

1. [Introduction](#introduction)
2. [Mathematical Framework](#mathematical-framework)
3. [Repository Structure](#repository-structure)
4. [Installation and Requirements](#installation-and-requirements)
5. [Usage and Compilation](#usage-and-compilation)
6. [Content Overview](#content-overview)
7. [Theoretical Background](#theoretical-background)
8. [Computational Tools](#computational-tools)
9. [Citation](#citation)
10. [References](#references)
11. [License](#license)
12. [Acknowledgments](#acknowledgments)

---

## Introduction

### Motivation

The design and analysis of spacecraft guidance, navigation, and control systems require a deep understanding of:

- **Attitude Representation Theory**: Rotation matrices, Euler angles, quaternions, and Modified Rodrigues Parameters (MRPs)
- **Orbital Mechanics**: Two-body problem, perturbed dynamics, and relative motion
- **Control Theory**: State-space methods, optimal control, and robust design
- **Sensor and Actuator Models**: High-fidelity models for gyroscopes, star trackers, reaction wheels, and thrusters

This repository provides a systematic treatment of these topics, emphasizing mathematical rigor and practical implementation.

### Scope and Objectives

The primary objectives are:

1. **Theoretical Development**: Rigorous derivations of fundamental equations
2. **Computational Implementation**: MATLAB/Python code for algorithms
3. **Practical Applications**: Case studies from real missions
4. **Educational Resource**: Comprehensive learning material for graduate students

---

## Mathematical Framework

### Notation Conventions

| Symbol | Description | Example |
|--------|-------------|---------|
| $\mathbb{R}^n$ | n-dimensional Euclidean space | $\mathbf{r} \in \mathbb{R}^3$ |
| $SO(3)$ | Special Orthogonal Group | $\mathbf{R} \in SO(3)$ |
| $\mathbb{S}^3$ | Unit quaternion space | $\mathbf{q} \in \mathbb{S}^3$ |
| $\mathcal{F}_I$ | Inertial reference frame | ECI frame |
| $\mathcal{F}_B$ | Body-fixed reference frame | Spacecraft frame |
| $\boldsymbol{\omega}$ | Angular velocity vector | rad/s |
| $\mathbf{J}$ | Moment of inertia tensor | kg·m² |

### Fundamental Equations

**Attitude Kinematics (Quaternion Form):**

$$
\dot{\mathbf{q}} = \frac{1}{2}\boldsymbol{\Omega}(\boldsymbol{\omega})\mathbf{q}
$$

**Euler's Rotational Equation:**

$$
\mathbf{J}\dot{\boldsymbol{\omega}} + \boldsymbol{\omega} \times \mathbf{J}\boldsymbol{\omega} = \mathbf{T}_{ext} + \mathbf{T}_{ctrl}
$$

**Orbital Dynamics (Two-Body):**

$$
\ddot{\mathbf{r}} + \frac{\mu}{r^3}\mathbf{r} = \mathbf{a}_{pert}
$$

---

## Repository Structure

```
spacecraft-dynamics-control/
│
├── manuscript/
│   ├── index.qmd                 # Main manuscript
│   ├── _quarto.yml              # Configuration
│   └── references.bib           # Bibliography
│
├── chapters/
│   ├── 01-mathematical-preliminaries/
│   │   ├── index.qmd
│   │   ├── vectors-matrices.qmd
│   │   └── exercises.qmd
│   ├── 02-attitude-representation/
│   │   ├── index.qmd
│   │   ├── rotation-matrices.qmd
│   │   ├── quaternions.qmd
│   │   └── mrp.qmd
│   ├── 03-orbital-dynamics/
│   ├── 04-perturbations/
│   ├── 05-attitude-kinematics/
│   ├── 06-attitude-dynamics/
│   ├── 07-sensors/
│   ├── 08-actuators/
│   ├── 09-attitude-determination/
│   ├── 10-control-design/
│   └── 11-case-studies/
│
├── code/
│   ├── matlab/
│   │   ├── attitude/
│   │   │   ├── quat2dcm.m
│   │   │   ├── dcm2quat.m
│   │   │   └── quatmult.m
│   │   ├── dynamics/
│   │   ├── orbit/
│   │   └── control/
│   ├── python/
│   │   ├── spacecraft_dynamics/
│   │   │   ├── __init__.py
│   │   │   ├── attitude.py
│   │   │   ├── orbit.py
│   │   │   └── control.py
│   │   └── tests/
│   └── simulations/
│
├── data/
│   ├── missions/              # Real mission data
│   ├── ephemeris/            # Planetary ephemeris
│   └── measurements/         # Sensor data
│
├── figures/
│   ├── diagrams/
│   ├── plots/
│   └── schematics/
│
├── appendices/
│   ├── A-mathematical-proofs.qmd
│   ├── B-derivations.qmd
│   └── C-algorithms.qmd
│
├── docs/
│   ├── api/                  # Code documentation
│   └── tutorials/            # Step-by-step guides
│
├── tests/
│   ├── unit/
│   └── integration/
│
├── .github/
│   └── workflows/
│       ├── quarto-publish.yml
│       └── code-tests.yml
│
├── README.md
├── LICENSE
├── CITATION.cff
├── .gitignore
└── environment.yml           # Conda environment

```

---

## Installation and Requirements

### System Requirements

- **Operating System**: Linux, macOS, or Windows 10+
- **RAM**: 8 GB minimum, 16 GB recommended
- **Disk Space**: 2 GB for repository and dependencies

### Software Dependencies

#### Core Tools

```bash
# Quarto (v1.4+)
# Download from: https://quarto.org/docs/get-started/

# Git
sudo apt-get install git  # Linux
brew install git          # macOS

# LaTeX distribution (for PDF output)
sudo apt-get install texlive-full  # Linux
brew install --cask mactex         # macOS
```

#### Python Environment

```bash
# Create conda environment
conda env create -f environment.yml
conda activate spacecraft-dynamics

# Or use pip
pip install -r requirements.txt
```

**requirements.txt:**
```
numpy>=1.24.0
scipy>=1.10.0
matplotlib>=3.7.0
pandas>=2.0.0
sympy>=1.12
jupyter>=1.0.0
plotly>=5.14.0
pytest>=7.3.0
black>=23.0.0
```

#### MATLAB Toolboxes (Optional)

- Aerospace Toolbox
- Control System Toolbox
- Optimization Toolbox
- Symbolic Math Toolbox

---

## Usage and Compilation

### Building the Manuscript

```bash
# Clone repository
git clone https://github.com/equintana-uptc/spacecraft-dynamics-control.git
cd spacecraft-dynamics-control

# Preview during development
quarto preview manuscript/

# Render all formats
quarto render manuscript/

# Render specific format
quarto render manuscript/ --to pdf
quarto render manuscript/ --to html
quarto render manuscript/ --to docx
```

### Running Simulations

```bash
# Python simulations
cd code/python
python simulations/attitude_propagation.py

# MATLAB simulations
cd code/matlab
matlab -batch "run('simulations/orbital_propagation.m')"
```

### Running Tests

```bash
# Python tests
pytest tests/

# MATLAB tests
matlab -batch "runtests('tests/')"
```

---

## Content Overview

### Part I: Mathematical Foundations

#### Chapter 1: Mathematical Preliminaries
- Vector spaces and linear algebra
- Matrix theory and properties
- Tensor calculus
- Differential geometry fundamentals

#### Chapter 2: Attitude Representation
- Direction cosine matrices (DCM)
- Euler angles (multiple conventions)
- Axis-angle representation (Rodrigues parameters)
- Unit quaternions
- Modified Rodrigues Parameters (MRP)
- Comparison and singularity analysis

### Part II: Dynamics

#### Chapter 3: Orbital Dynamics
- Two-body problem and Kepler's laws
- Classical orbital elements (COE)
- Orbital maneuvers and transfers
- Orbit propagation methods
- Lagrange planetary equations

#### Chapter 4: Environmental Perturbations
- Gravitational perturbations (J2, J3, third-body)
- Atmospheric drag modeling
- Solar radiation pressure
- Magnetic field interactions
- Comprehensive disturbance models

#### Chapter 5: Perturbed Orbital Dynamics
- Gauss variational equations
- Lagrange planetary equations
- Hill-Clohessy-Wiltshire (HCW) equations
- Restricted three-body problem
- Formation flying dynamics

#### Chapter 6: Attitude Kinematics
- Kinematic differential equations
- Euler angle kinematics
- Quaternion kinematics and properties
- Error kinematics for control
- Kinematic singularities

#### Chapter 7: Attitude Dynamics
- Euler's equations of motion
- Torque-free motion and stability
- Gravity gradient torque effects
- Dual-spin spacecraft
- Momentum exchange devices

### Part III: Sensors and Actuators

#### Chapter 8: Orbit and Attitude Sensors
- Inertial measurement units (IMU)
- MEMS gyroscopes and accelerometers
- Star trackers and star catalogs
- Sun sensors and Earth horizon sensors
- Magnetometers
- GPS/GNSS receivers
- Sensor error models and calibration

#### Chapter 9: Actuators
- Chemical and electric propulsion
- Reaction wheels and momentum wheels
- Control moment gyroscopes (CMG)
- Magnetic torquers
- Thruster configurations
- Actuator dynamics and saturation

### Part IV: Estimation and Control

#### Chapter 10: Attitude Determination
- TRIAD algorithm
- Wahba's problem formulation
- QUEST and ESOQ algorithms
- Davenport's q-method
- SVD-based methods
- Extended Kalman Filter (EKF)
- Unscented Kalman Filter (UKF)

#### Chapter 11: Orbital Control
- Drag-free control systems
- Station-keeping maneuvers
- Orbit transfer optimization
- Orbital quaternion prediction
- Relative navigation and control

#### Chapter 12: Attitude Control Systems
- PD and PID control laws
- Linear Quadratic Regulator (LQR)
- Sliding mode control
- Embedded Model Control (EMC)
- Momentum management
- Detumbling strategies

### Part V: Applications

#### Chapter 13: Case Study - Scientific Mission
- Mission requirements and constraints
- ADCS architecture design
- Mode definitions and transitions
- Simulation results and validation
- Failure modes and recovery

#### Chapter 14: Advanced Topics
- Optimal control theory
- Robust control design
- Adaptive control methods
- Machine learning applications
- Multi-spacecraft coordination

---

## Theoretical Background

### Embedded Model Control (EMC)

The EMC approach, developed by Canuto et al., represents a paradigm shift in spacecraft control design. Key principles include:

1. **Embedded Disturbance Model**: Explicit modeling of disturbances in the control law
2. **Command and Disturbance Governors**: Separation of tracking and rejection
3. **State Prediction**: High-bandwidth state estimation
4. **Model Uncertainty**: Systematic treatment of modeling errors

**Control Architecture:**

```
Reference → Command → State → Control → Plant
Commands   Governor   Predictor  Law

               ↑          ↑
               │          │
         Disturbance ← Measurements
          Governor
```

### Quaternion Algebra

Quaternions provide singularity-free attitude representation:

$$
\mathbf{q} = \begin{bmatrix} q_0 \\ \mathbf{q}_v \end{bmatrix} = \begin{bmatrix} \cos(\phi/2) \\ \mathbf{e}\sin(\phi/2) \end{bmatrix}
$$

where $\phi$ is rotation angle and $\mathbf{e}$ is the rotation axis.

**Quaternion Multiplication:**

$$
\mathbf{q}_1 \otimes \mathbf{q}_2 = \begin{bmatrix} q_{1,0}q_{2,0} - \mathbf{q}_{1,v}^T\mathbf{q}_{2,v} \\ q_{1,0}\mathbf{q}_{2,v} + q_{2,0}\mathbf{q}_{1,v} + \mathbf{q}_{1,v} \times \mathbf{q}_{2,v} \end{bmatrix}
$$

---

## Computational Tools

### Python Package: `spacecraft_dynamics`

Comprehensive Python library for spacecraft analysis:

```python
from spacecraft_dynamics import attitude, orbit, control

# Quaternion operations
q1 = attitude.Quaternion([1, 0, 0, 0])
q2 = attitude.Quaternion.from_euler([0, 0, np.pi/4])
q_result = q1 * q2

# Orbital propagation
state0 = orbit.ClassicalElements(a=7000e3, e=0.001, i=np.deg2rad(51.6))
trajectory = orbit.propagate(state0, t_span=[0, 86400])

# Control design
controller = control.LQR(Q=np.eye(6), R=np.eye(3))
torque = controller.compute(state, reference)
```

### MATLAB Functions

Professional-grade functions following aerospace standards:

```matlab
% Attitude conversion
dcm = quat2dcm(q);
q = euler2quat(phi, theta, psi, 'ZYX');

% Dynamics simulation
[t, state] = ode45(@(t,x) spacecraft_eom(t, x, params), tspan, x0);

% Control
K = lqr(A, B, Q, R);
u = -K * (x - x_ref);
```

---

## Citation

If you use this work in your research, please cite:

### BibTeX

```bibtex
@misc{quintana2024spacecraft,
  author = {Quintana Silva, Emanuel},
  title = {Spacecraft Dynamics and Control: Mathematical Foundations and Applications},
  year = {2024},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/equintana-uptc/spacecraft-dynamics-control}},
  institution = {Universidad Pedagógica y Tecnológica de Colombia}
}
```

### APA Format

Quintana Silva, E. (2024). *Spacecraft dynamics and control: Mathematical foundations and applications*. Universidad Pedagógica y Tecnológica de Colombia. https://github.com/equintana-uptc/spacecraft-dynamics-control

---

## References

### Primary Textbook

Canuto, E., Novara, C., Massotti, L., Carlucci, D., & Perez Montenegro, C. (2018). *Spacecraft dynamics and control: The embedded model control approach*. Butterworth-Heinemann. https://doi.org/10.1016/C2015-0-04007-5

### Foundational Works

- Wertz, J. R. (Ed.). (2012). *Spacecraft attitude determination and control*. Springer Science & Business Media.
- Wie, B. (2008). *Space vehicle dynamics and control* (2nd ed.). American Institute of Aeronautics and Astronautics.
- Markley, F. L., & Crassidis, J. L. (2014). *Fundamentals of spacecraft attitude determination and control*. Springer.
- Vallado, D. A. (2013). *Fundamentals of astrodynamics and applications* (4th ed.). Microcosm Press.

### Research Articles

- Shuster, M. D., & Oh, S. D. (1981). Three-axis attitude determination from vector observations. *Journal of Guidance and Control*, 4(1), 70-77.
- Markley, F. L. (1988). Attitude determination using vector observations and the singular value decomposition. *The Journal of the Astronautical Sciences*, 36(3), 245-258.

---

## License

### Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International

This work is licensed under CC BY-NC-SA 4.0. You are free to:

- **Share**: Copy and redistribute the material
- **Adapt**: Remix, transform, and build upon the material

Under the following terms:

- **Attribution**: Appropriate credit must be given
- **NonCommercial**: Not for commercial purposes
- **ShareAlike**: Distributed under the same license

Full license: https://creativecommons.org/licenses/by-nc-sa/4.0/

### Code License

Software components are licensed under the MIT License.

---

## Acknowledgments

### Institutional Support

- **Universidad Pedagógica y Tecnológica de Colombia (UPTC)** - Academic support and resources
- **School of Engineering** - Research facilities

### Technical References

This work builds upon the foundational research of:

- European Space Agency (ESA) - GOCE mission data and documentation
- NASA - Public datasets and technical reports
- Politecnico di Torino - EMC methodology development

### Open Source Community

Special thanks to the developers of:

- Quarto - Scientific publishing system
- Python Scientific Stack - NumPy, SciPy, Matplotlib
- MATLAB - Numerical computing environment

---

## Contributing

### Guidelines for Contributors

Contributions are welcome! Please follow these guidelines:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** changes (`git commit -m 'Add AmazingFeature'`)
4. **Push** to branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### Code Standards

- Python: Follow PEP 8, use Black formatter
- MATLAB: Follow MATLAB Style Guidelines
- Documentation: Use NumPy docstring format
- Testing: Maintain >90% code coverage

### Reporting Issues

Please use GitHub Issues with appropriate labels:

- `bug`: Something isn't working
- `enhancement`: New feature request
- `documentation`: Documentation improvements
- `question`: Further information requested

---

## Contact and Support

### Primary Contact

**Emanuel Quintana Silva**  
 emanuel.quintana@uptc.edu.co  
 Universidad Pedagógica y Tecnológica de Colombia  
 Sogamoso, Boyacá, Colombia

### Project Links

- **Repository**: https://github.com/equintana-uptc/spacecraft-dynamics-control
- **Documentation**: https://equintana-uptc.github.io/spacecraft-dynamics-control
- **Issues**: https://github.com/equintana-uptc/spacecraft-dynamics-control/issues

---

<div align="center">

**Star this repository if you find it useful!**

*Made with love for the aerospace engineering community*

 ![UPTC Logo](image.png)

</div>
