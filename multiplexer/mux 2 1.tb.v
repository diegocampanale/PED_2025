 ‘timescale 1ns/100 ps
 module multiplexer_2_1_tb ;
reg a , b , select ;
 wire y ;

 m u l t i p l e x e r _ 2 _ 1 DUT (
. a ( a ) ,
. b ( b ) ,
. select ( select ) ,
. y ( y )
11 );
12
13 initial begin
14 $ du mpf ile ( " t e s t _ m u x _ 2 _ 1 . vcd " );
15 $ du mpv ars (0 , m u l t i p l e x e r _ 2 _ 1 _ t b );
16 a =1 ’ b0 ; b =1 ’ b0 ; select =1 ’ b0 ;
17 #5 a =1 ’ b1 ;
18 #5 select = 1 ’ b1 ;
19 #5 b =1 ’ b1 ;
20 #5 a =1 ’ b0 ;
21 #5 $finish ;
22 end
23 endmodule