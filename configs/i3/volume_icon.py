import fileinput

a = fileinput.input()

p = a[0].replace("\n", "")

volN = a[1]
volS = a[2]
volB = a[3]
mute = a[4]

def volDisplay():
    if p == "MUTE":
        return mute+p
    if int(p.replace("%", "")) == 0:
        return volN+p
    if int(p.replace("%", "")) < 50:
        return volS+p
    if int(p.replace("%", "")) >= 50:
        return volB+p

print volDisplay().replace("\n", "")
