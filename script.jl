ENV["GKSwstype"] = "100"
using Plots, LaTeXStrings, Base.MathConstants

x = range(-3, 3, length = 10000)
y = @. (sqrt((9 - x^2) / 2) / sin(80 * x) + log(abs(x) + 1/2))

plot(x, y,
     legend = false,
     linewidth = 1,
     size = (1000, 1150),
     color = :red,
     framestyle = :origin,
     aspect_ratio = :equal,
     xlims = (-4, 4),
     ylims = (-4, 4),
     grid = true,
     gridalpha = 0.4,
     gridlinewidth = 1,
     minorgrid = true,
     minorgridalpha = 0.15,
     xticks = -4:1:4,
     yticks = -4:1:4,
     tickfontsize = 12,
     tickfontcolor = :black,
     title = L"y = \frac{\sqrt{\frac{9-x^2}{2}}}{\sin(80x)} + \ln\left(|x|+\frac{1}{2}\right)",
     titlefontsize = 24)

savefig("app.svg")
