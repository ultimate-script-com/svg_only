ENV["GKSwstype"] = "100"
using Plots, LaTeXStrings

x = -ℯ:0.0005:ℯ
y = @. sin(ℯ^5 * x) * sqrt(max(ℯ^2 - x^2, 0) / 1.8) + log(abs(x) + 0.7)

plot(x, y,
     legend = false,
     linewidth = 1,
     size = (700, 700),
     color = :red,
     title = L"y = \sin(e^{5}x)\sqrt{\dfrac{e^{2}-x^{2}}{1.8}} + \ln(|x| + 0.7)",
     titlefontsize = 12)

# グラフ内の好きな位置に置く場合
# annotate!(0, 3, text(L"y = \sin(e^{5}x)\sqrt{\dfrac{e^{2}-x^{2}}{1.8}} + \ln(|x|+0.7)", 10, :black))

savefig("app.svg")
