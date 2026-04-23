# L0Soft

MATLAB implementation of **L0Soft**, a sparse recovery algorithm introduced in:

**Mostafa Sadeghi, Fateme Ghayem, Massoud Babaie-Zadeh, Saikat Chatterjee, Mikael Skoglund, Christian Jutten**  
**“L0Soft: l0 Minimization via Soft Thresholding”**  
EUSIPCO 2019

Paper: [L0Soft_EUSIPCO_2019.pdf](https://ghayem.github.io/files/L0Soft_EUSIPCO_2019.pdf)

---

## Overview

L0Soft is a method for recovering sparse solutions of linear inverse problems of the form

**minimize** `||x||_0` **subject to** `||y - Ax||_2 <= epsilon`.

The main idea of the paper is to use the identity

`||x||_0 = ||sgn(x)||_1`

and then replace the discontinuous sign function with a smooth approximation based on `tanh(beta*x)`.

This leads to an optimization strategy that combines:
- a smooth approximation of the sign function,
- an auxiliary variable,
- soft-thresholding updates,
- and an iterative continuation scheme.

The repository provides a compact MATLAB implementation of the core solver.

---

## Repository contents

- `L0Soft.m` — main MATLAB solver
- `mysoft.m` — element-wise soft-thresholding operator

---

## Method summary

The method introduces an auxiliary variable `z` such that `z ≈ sgn(x)`, and uses the smooth approximation

`f_beta(x) = tanh(beta*x)`.

Using this idea, the original sparse recovery problem is transformed into a relaxed optimization problem that can be solved by alternating updates:

1. **Update `z` using soft-thresholding**
2. **Update `x` using a gradient-type step**
3. **Decrease the continuation parameter across outer iterations**

This approach is designed to approximate l0 minimization while remaining computationally tractable.

The paper evaluates the method on:
- synthetic sparse signal recovery problems,
- and image reconstruction experiments from compressed measurements.

According to the paper, L0Soft performs competitively against several baseline sparse recovery methods, especially in more challenging sparsity regimes.

---

## Requirements

- MATLAB

The repository is minimal and uses standard MATLAB operations. No external toolbox is required in the code.

