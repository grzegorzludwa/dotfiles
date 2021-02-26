import subprocess
import itertools

command="xrandr --listmonitors"

output = subprocess.run(command.split(), stdout=subprocess.PIPE, check=True, text=True)
output = output.stdout

displays_lines = output.split('\n')[1:-1]

displays = []
for line in displays_lines:
    displays.append(line.split()[-1])

options = []
for L in range(1, len(displays)):
    for subset in itertools.combinations(displays, L):
        options.append(subset)

for item in itertools.permutations(displays):
    options.append(item)

#print(options)

for option in options:
    if len(option) == 1:
        print(option[0] + " ONLY")
    else:
        to_print = option[0]
        for i in range(1, len(option)):
            to_print = to_print + " + " + option[i]
        print(to_print)
print("All the same")
