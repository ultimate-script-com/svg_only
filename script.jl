ENV["GKSwstype"] = "100"
using Plots, LaTeXStrings

x = -ℯ:0.0005:ℯ
y = @. sin(ℯ^5 * x) * sqrt(max(ℯ^2 - x^2, 0) / 1.8) + log(abs(x) + 0.7)

plot(x, y,
     legend = false,
     linewidth = 1,
     size = (512, 512),
     color = :red,
     title = L"y = \sin(e^{5}x)\sqrt{\dfrac{e^{2}-x^{2}}{1.8}} + \ln(|x| + 0.7)",
     titlefontsize = 12)

savefig("app.svg") #SVGファイルを生成

#レスポンシブ化
write("app.svg", replace(read("app.svg", String), r"(<svg[^>]*?)\swidth=\"[^\"]*\"\sheight=\"[^\"]*\"" => s"\1 style=\"display:block;margin:auto;width:96vmin;width:96dvmin;height:90vmin;height:90dvmin\""; count = 1))
