<script src="http://d3js.org/d3.v3.js"></script>
<script type="text/javascript">


  var init=1;
  updateView = function(message) {
   
  var svg = d3.select(".d3io").select("svg").style("width", 300).style("height", 300);
    
  if (init==1)
  {
    svg.append("circle")
    .attr("cx",message[0])
    .attr("cy",message[1])
    .attr("r",30).style("opacity",0.5)
    .attr("id", "kreis");
  
    /*svg.append("text")
    .attr("x",message[0]-10)
    .attr("y",message[1])
    .attr("id", "yes")
    .text("Yes!");*/
    init=0;
  }else{
    
    /*
    var yes=d3.select("#yes");
    
    yes.attr("x",message[0]-10)
    .attr("y",message[1])
    .text("Yes!!!");*/
    
    var kreis=d3.select("#kreis");
    kreis.attr("cx",message[0])
    .attr("cy",message[1])
    .attr("fill",message[2]);
        
  }    
  return init;
}
    
var d3OutputBinding = new Shiny.OutputBinding();
  $.extend(d3OutputBinding, {
    find: function(scope) {
      return $(scope).find(".d3io");
    },
    renderError: function(el,error) {
      //console.log("Foe");
    },
    renderValue: function(el,data) {
      updateView(data);
      //console.log("Friend");
    }
  });

  Shiny.outputBindings.register(d3OutputBinding);  
  
  var d3InputBinding = new Shiny.InputBinding();
  
  $.extend(d3InputBinding, {
    find: function(scope) {
      return $(scope).find(".d3io");
    },
    getValue: function(el) {
      return init;
    },
    subscribe: function(el, callback) {
      $(el).on("change.d3InputBinding", function(e) {
        callback();
      });
    }
  });
  Shiny.inputBindings.register(d3InputBinding);


</script>