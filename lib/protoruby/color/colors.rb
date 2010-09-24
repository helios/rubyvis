module Protoruby
  def self.colors(*args)
    scale=Protoruby::Scale.ordinal
    scale.range(*args)
    scale
  end
  module Colors
    def pv
      Protoruby
    end
    def category20(*arguments)
      scale = pv.colors(
      "#1f77b4", "#aec7e8", "#ff7f0e", "#ffbb78", "#2ca02c",
      "#98df8a", "#d62728", "#ff9896", "#9467bd", "#c5b0d5",
      "#8c564b", "#c49c94", "#e377c2", "#f7b6d2", "#7f7f7f",
      "#c7c7c7", "#bcbd22", "#dbdb8d", "#17becf", "#9edae5")
      scale.domain(*arguments);
      scale
    end
  end
end