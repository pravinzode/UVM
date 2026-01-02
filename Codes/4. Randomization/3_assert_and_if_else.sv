// Code your testbench here
//////////transaction 
//////////////// generator
 
class generator;
  
  randc bit [3:0] a, b; ////////////rand or randc 
  bit [3:0] y;
  
  
  //constraint data {a > 15;}
 
  
    
endclass
 
module tb;
  generator g;
  int i = 0;
  int status = 0;
  
  initial begin
    g = new();
    
    for(i=0;i<10;i++) begin
     /* 
      if(!g.randomize()) begin
        $display("Randomization Failed at %0t", $time); 
        $finish();
      end
      */
      
      assert(g.randomize())else 
        begin
                $display("Randomization Failed at %0t", $time); 
                $finish();
        end
      
      $display("Value of a :%0d and b: %0d", g.a,g.b);
      #10;
    end
    
  end
  
  
endmodule