grammar metamath;

library: statement* EOF;

scope: '${' statement* '$}';
statement : const_decls 
          | var_decls 
          | disjoint_restriction 
          | floating_hypothesis 
          | essential_hypothesis 
          | axiomatic_assertion 
          | provable_assertion 
          | scope;

proof : ({$open_p.text == "("}? open_p=IDENTIFIER labels+=symbol+ close_p=IDENTIFIER {$close_p.text == ")"}? indices+=index+) | labels+=symbol+;

const_decls: '$c' constants+=symbol+ '$.';
var_decls: '$v' vars+=symbol+ '$.';
disjoint_restriction: '$d' vars+=symbol+ '$.';
floating_hypothesis: label=symbol '$f' constant=symbol var=symbol '$.';
essential_hypothesis: label=symbol '$e' constant=symbol def=symbol+ '$.';
axiomatic_assertion: label=symbol '$a' constant=symbol def+=symbol+ '$.';
provable_assertion: label=symbol '$p' constant=symbol def+=symbol+ '$=' proof '$.';

index returns [int result]: val=IDENTIFIER { $result = $val.int; };
symbol: IDENTIFIER;

IDENTIFIER: [\u0021-\u007E]+;

COMMENT: '$(' .+? '$)' -> channel(HIDDEN);
WS : [ \t\r\n]+ -> channel(HIDDEN);
