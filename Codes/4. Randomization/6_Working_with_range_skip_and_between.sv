class generator;
  
  randc bit [3:0] a, b; ////////////rand or randc 
  bit [3:0] y;
  /*
  constraint data_a {a > 3; a < 7;}
  
  constraint data_b {b == 3;}
  */
  
  //constraint data {a > 3; a < 7 ; b > 0;}
  
/*
  constraint data {
    a inside {[0:8],[10:11],15} ; //0 1 2 3 4 5 6 7 8  10 11 15  
    b inside {[3:11]} ;  // 3 4 5 6 7 8 9 10 11
                  
                  }
*/
  
  
  constraint data {
    !(a inside {[3:7]});
    !(b inside {[5:9]});
  
  }
  
  
  
  ///// a = 3:7, b = 5:9
  
endclass
 
module tb;
  generator g;
  int i = 0;
  int status = 0;
  
  initial begin
   g = new();
    
    for(i=0;i<15;i++) begin
      
      assert(g.randomize()) else $display("Randomization Failed");
      $display("Value of a :%0d and b: %0d", g.a,g.b);
      #10;
    end
    
  end
  
  
endmodule