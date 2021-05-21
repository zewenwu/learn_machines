
import random, math

# Set up Bouffon's experiment
N = 100000
total_intersected = 0

# Throw the N needles
for i in range(0, N):
    theta = random.uniform(0, math.pi/2)
    x = random.uniform(0, 1)
    needle_intersected = (x < math.sin(theta)/2)
    if (needle_intersected):
        total_intersected += 1

# Getting the results
pi_estimate = N/total_intersected

print("\nBouffon's estimation of pi: ", pi_estimate)
print("Value of pi: ", math.pi, "\n")

print("Absolute error: ", abs(pi_estimate - math.pi))
print("Relative absolute error: ", abs(pi_estimate - math.pi)/math.pi)



