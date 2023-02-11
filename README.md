# **NTHRATIO** and **RNTHCOMP** XSPEC models, by Federico García

**RNTHCOMP** is an *auxiliary* XSPEC model. It is the same as *NTHCOMP* model,
with a different normalization. The model is unity at the energy given by a 
certain fixed parameter.

**NTHRATIO** is a *multiplicative* XSPEC model based on **RNTHCOMP**, used to
first-order correct the soft-excess introduced by *xillver*-based models
(due to `kTin` being fixed to `0.05` or `0.01 keV`).

---

## Installation

In order to use **NTHRATIO** one needs to have *HEASOFT* installed from source
code to allow for XSPEC local models compilation. 

1. Download this full repository and untar/unzip its contents.
2. Load *HEASOFT*.
3. Go to the code directory.
4. Execute: `initpackage nthratio lmod_nthratio.dat .; hmake` (or choose your preferred `PATH`).
5. The model will hopefully compile. Now you're ready to load it into XSPEC.
6. Open XSPEC, load the model using: `lmod nthratio .` (or the `PATH` to the compiled model).

## Usage

**NTHRATIO** is a *multiplicative* model to correct `xilver/relxill` models. For example, it can be invoked as:

```
model tbabs*(diskbb+nthcomp+nthratio*relxillCp)
```

In such a case, `relxillCp` should be used with `refl_frac=-1`, and the parameters of **NTHRATIO** (`Gamma`, `kT_e`, `kT_bb`) should be tied to those from `nthcomp`, and `relxillCp`. It is important to remark that **NTHRATIO** does not add any new free parameter to the global model. 

## Important Note

This project is under development. Please contact the author if you're interested in using the model.
