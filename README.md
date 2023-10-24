# Seminario dell'esame Metodi Numerici per la Grafica

Questa repository contiene il codice sorgente per le implementazioni dei
`two-point-scheme` e `four-point-scheme` dell'articolo
`Non-uniform interpolatory subdivizion schemes with improved smoothness (CAGD 2022)`
assegnato per il seminario

## Utilizzo

Per riprodurre la sperimentazione numerica mostrata nell'articolo e nel
seminario, utilizzare i seguenti comandi (testati su Octave)

```
polygon(@two_point_stationary_step, 2, "st", true)
polygon(@two_point_ex1_step, 2, "ex1", false)
polygon(@two_point_ex2_step, 2, "ex2", false)
polygon(@four_point_stationary_step, 4, "st", true)
polygon(@four_point_ex3_step, 4, "ex3", false)
polygon(@four_point_ex4_step, 4, "ex4", false)

func(@two_point_stationary_step, 2, "st", true)
func(@two_point_ex1_step, 2, "ex1", false)
func(@two_point_ex2_step, 2, "ex2", false)
func(@four_point_stationary_step, 4, "st", true)
func(@four_point_ex3_step, 4, "ex3", false)
func(@four_point_ex4_step, 4, "ex4", false)
```
