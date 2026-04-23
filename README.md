# L0Soft

MATLAB implementation of **L0Soft**, a sparse recovery algorithm introduced in:

**Mostafa Sadeghi, Fateme Ghayem, Massoud Babaie-Zadeh, Saikat Chatterjee, Mikael Skoglund, Christian Jutten**,  
**“L0Soft: \ell_0 Minimization via Soft Thresholding”**,  
EUSIPCO 2019.

Paper: [PDF](https://ghayem.github.io/files/L0Soft_EUSIPCO_2019.pdf)

---

## Overview

L0Soft is a method for recovering sparse solutions of linear inverse problems of the form

\[
\min_x \|x\|_0 \quad \text{s.t.} \quad \|y-Ax\|_2 \le \varepsilon.
\]

The main idea of the paper is to use the identity

\[
\|x\|_0 = \|\operatorname{sgn}(x)\|_1,
\]

then replace the discontinuous sign function with a smooth approximation based on `tanh(\beta x)`. This reformulates the problem into one involving an \(\ell_1\)-type penalty on an auxiliary variable, which can then be handled with proximal updates and soft-thresholding. The paper develops the method using a PALM-style alternating scheme with inertial acceleration and a decreasing penalty parameter.  
See the abstract, problem formulation, and algorithm sections of the paper for the derivation. :contentReference[oaicite:1]{index=1}

---

## Repository contents

- `L0Soft.m` — main MATLAB solver
- `mysoft.m` — entry-wise soft-thresholding operator
- `README.md` — repository description

The current repository is intentionally compact and contains the core implementation only. :contentReference[oaicite:2]{index=2}

---

## Method summary

The paper introduces an auxiliary variable \(z\) such that \(z \approx \operatorname{sgn}(x)\), and uses the smooth approximation

\[
f_\beta(x) = \tanh(\beta x).
\]

The optimization is then written in terms of:
- a smooth coupling term between \(x\) and \(z\),
- an \(\ell_1\) penalty on \(z\),
- and a data-consistency constraint on \(x\).

This leads to alternating updates:
1. **Soft-thresholding update for \(z\)**  
2. **Projected gradient-type update for \(x\)**  
3. **Continuation on the penalty parameter** by decreasing \(\alpha\) across outer iterations. :contentReference[oaicite:3]{index=3}

In the paper, the algorithm is evaluated on:
- synthetic sparse recovery experiments, and
- natural image reconstruction from underdetermined Gaussian measurements using sparse DCT coefficients.  
The reported results show competitive performance against ISP-Hard, IHT, TST, and SL0, with stronger performance especially in less sparse regimes. :contentReference[oaicite:4]{index=4}

---

## Requirements

- MATLAB

No additional toolbox requirements are documented in the repository. The implementation uses standard MATLAB operations such as `pinv`, `tanh`, and matrix multiplications. Based on the code alone, it should run in a basic MATLAB environment. :contentReference[oaicite:5]{index=5}
