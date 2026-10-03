ENV["GKSwstype"] = "100"
using Plots, LaTeXStrings

x = range(-ℯ, ℯ, length = 4000)
y = @. sin(99x) * sqrt((ℯ^2 - x^2) / 1.8) + log(abs(x) + 0.7)

plot(x, real.(y),
     legend = false,
     linewidth = 1,
     size = (900, 900),
     color = :red,
     title = L"y = \sin(99x)\sqrt{\frac{e^2-x^2}{1.8}}+\ln(|x|+0.7)",
     titlefontsize = 32)

savefig("app.svg")
