using Plots

x = -3:0.01:3
y = x .^ 2

plot(x, y, label="y = x²", xlabel="x", ylabel="y")

savefig("app.svg")
