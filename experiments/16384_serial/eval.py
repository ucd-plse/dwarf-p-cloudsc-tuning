import sys
import os

log_path = sys.argv[1]

# thresholds taken from uniform single precision execution
THRESHOLDS = [
    0.5321494536474E-03,
    0.6905775051564E-02,
    0.0000000000000E+00,
    0.1170999717712E+02,
    0.2795177698135E+01,
    0.1295360177755E+00,
    0.6603062748909E+00,
    0.1194109916687E+02,
    0.2776875019073E+01,
    0.1155032217503E+00,
    0.6107913255692E+00,
    0.2145190665033E-03,
    0.2424771373626E-03,
    0.0000000000000E+00,
    0.4361577332020E+00,
    0.0000000000000E+00,
    0.4353882372379E+00,
    0.1467732805759E-01,
    0.1088317990303E+01,
    0.1073085665703E+01,
    0.1871044397354E+01,
]

cost = 0
try:               
    with open(os.path.join(log_path, "outlog.txt"), "r") as f:
        lines = f.readlines()
    i = -1
    while i+1 < len(lines) and "     NUMOMP    NGPTOT  #GP-cols     #BLKS    NPROMA tid# : Time(msec)  MFlops/s     col/s" not in lines[i-1]:
        i += 1
    cost = abs(float(lines[i].split()[7]))

    while i+1 < len(lines) and "             Variable Dim             MinValue             MaxValue            AbsMaxErr         AvgAbsErr/GP          MaxRelErr-%" not in lines[i]:
        i += 1

    metric_idx = 0
    while i+1 < len(lines) and lines[i+1].strip() != "":
        i += 1
        error = float(lines[i].split()[6])
        if error > THRESHOLDS[metric_idx]:
            cost = -1 * cost
            break
        metric_idx += 1

except FileNotFoundError:
    pass

print(cost)