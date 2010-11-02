require File.dirname(__FILE__)+"/spec_helper.rb"
describe "Ruby API for Rubyvis" do
  before do
    @h=200
    @w=200
  end
  it "should create a Panel with a block" do
    lambda {@vis = Rubyvis.Panel.new {
      width @w
      height @h
    }
    }.should_not raise_exception
    @vis._properties.size.should==2
  end
  it "should create a Bar with new method" do
    vis1=Rubyvis.Panel.new.width(@w).height(@h)
    vis1.add(Rubyvis::Bar).
      data([1,2,3]).
      width(10).
      height(10).
      left(lambda {|x| x*10}).anchor('top').
        add(Rubyvis::Label).
          text(lambda {|x| x})
    vis1.render
    svg1=vis1.to_svg
  
    ww=@w
    hh=@h
    vis2=Rubyvis.Panel.new {|pan|
      pan.width ww
      pan.height hh
      pan.bar {
        data([1,2,3])
        width 10
        height 10
        left {|x| x*10}
        label(:anchor=>'top') {
          text {|x| x}
        }
      }
    }
    vis2.render
    svg2=vis2.to_svg
    svg1.should==svg2
    
  end
end